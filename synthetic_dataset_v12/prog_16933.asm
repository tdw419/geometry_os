; DESCRIPTION: Composite: Places a black circle of radius 54 at center (366, 155) then Draws a cyan line from (409, 254) to (70, 121).
; PLAN: r0=366(x), r1=155(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x1), r6=254(y1), r7=70(x2), r8=121(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 155
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 254
LDI r7, 70
LDI r8, 121
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
