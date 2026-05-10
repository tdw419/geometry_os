; DESCRIPTION: Composite: Places a white circle of radius 24 at center (211, 212) then Places a black line segment connecting (418, 164) to (231, 80).
; PLAN: r0=211(x), r1=212(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x1), r6=164(y1), r7=231(x2), r8=80(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 212
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 164
LDI r7, 231
LDI r8, 80
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
