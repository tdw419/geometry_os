; DESCRIPTION: Composite: Places a green line segment connecting (230, 238) to (252, 117) then Draws a purple circle centered at (64, 69) with radius 32 then Sets a single cyan pixel at (158, 25).
; PLAN: r0=230(x1), r1=238(y1), r2=252(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=69(y), r7=32(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=158(x), r11=25(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 238
LDI r2, 252
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 69
LDI r7, 32
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 158
LDI r11, 25
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
