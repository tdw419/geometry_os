; DESCRIPTION: Composite: Draws a black circle centered at (210, 133) with radius 66 then Renders a cyan box of size 50x97 starting at (35, 69).
; PLAN: r0=210(x), r1=133(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=69(y), r7=50(width), r8=97(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 133
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 69
LDI r7, 50
LDI r8, 97
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
