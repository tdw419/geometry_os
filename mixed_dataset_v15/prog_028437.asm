; DESCRIPTION: Composite: Renders a cyan box of size 76x107 starting at (233, 122) then Places a blue line segment connecting (108, 20) to (397, 71) then Renders a purple disk with center (302, 195) and radius 59.
; PLAN: r0=233(x), r1=122(y), r2=76(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x1), r6=20(y1), r7=397(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=195(y), r12=59(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 122
LDI r2, 76
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 20
LDI r7, 397
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 195
LDI r12, 59
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
