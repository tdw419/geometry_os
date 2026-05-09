; DESCRIPTION: Composite: Renders a magenta box of size 71x54 starting at (133, 199) then Places a red circle of radius 47 at center (374, 65).
; PLAN: r0=133(x), r1=199(y), r2=71(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=374(x), r6=65(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 133
LDI r1, 199
LDI r2, 71
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 65
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
