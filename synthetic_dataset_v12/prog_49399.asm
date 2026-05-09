; DESCRIPTION: Composite: Renders a white box of size 51x69 starting at (38, 151) then Places a purple line segment connecting (271, 133) to (349, 87) then Places a green dot at position (507, 222).
; PLAN: r0=38(x), r1=151(y), r2=51(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x1), r6=133(y1), r7=349(x2), r8=87(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=507(x), r11=222(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 38
LDI r1, 151
LDI r2, 51
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 133
LDI r7, 349
LDI r8, 87
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 507
LDI r11, 222
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
