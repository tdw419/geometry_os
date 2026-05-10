; DESCRIPTION: Composite: Places a black line segment connecting (84, 151) to (176, 25) then Places a white circle of radius 36 at center (231, 188).
; PLAN: r0=84(x1), r1=151(y1), r2=176(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=188(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 84
LDI r1, 151
LDI r2, 176
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 188
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
