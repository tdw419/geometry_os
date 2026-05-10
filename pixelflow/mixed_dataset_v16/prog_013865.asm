; DESCRIPTION: Composite: Draws a white line from (430, 222) to (23, 219) then Places a green circle of radius 66 at center (422, 123).
; PLAN: r0=430(x1), r1=222(y1), r2=23(x2), r3=219(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=123(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 430
LDI r1, 222
LDI r2, 23
LDI r3, 219
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 123
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
