; DESCRIPTION: Composite: Places a black circle of radius 22 at center (470, 223) then Places a black line segment connecting (333, 232) to (358, 40).
; PLAN: r0=470(x), r1=223(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=333(x1), r6=232(y1), r7=358(x2), r8=40(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 470
LDI r1, 223
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 333
LDI r6, 232
LDI r7, 358
LDI r8, 40
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
