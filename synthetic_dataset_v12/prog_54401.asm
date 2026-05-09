; DESCRIPTION: Composite: Places a black line segment connecting (455, 21) to (416, 25) then Places a green circle of radius 36 at center (252, 66) then Sets a single magenta pixel at (484, 213).
; PLAN: r0=455(x1), r1=21(y1), r2=416(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=66(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=484(x), r11=213(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 455
LDI r1, 21
LDI r2, 416
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 66
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 484
LDI r11, 213
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
