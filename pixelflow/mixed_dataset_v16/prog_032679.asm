; DESCRIPTION: Composite: Places a yellow 21x52 rectangle at position (441, 73) then Places a black line segment connecting (22, 113) to (181, 188) then Places a green dot at position (360, 123).
; PLAN: r0=441(x), r1=73(y), r2=21(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=22(x1), r6=113(y1), r7=181(x2), r8=188(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=123(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 73
LDI r2, 21
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 113
LDI r7, 181
LDI r8, 188
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 123
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
