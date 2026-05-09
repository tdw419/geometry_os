; DESCRIPTION: Composite: Renders a magenta box of size 39x106 starting at (59, 119) then Draws a cyan circle centered at (172, 133) with radius 50.
; PLAN: r0=59(x), r1=119(y), r2=39(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x), r6=133(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 59
LDI r1, 119
LDI r2, 39
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 133
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
