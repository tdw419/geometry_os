; DESCRIPTION: Composite: Places a white line segment connecting (419, 96) to (40, 213) then Places a blue dot at position (407, 129).
; PLAN: r0=419(x1), r1=96(y1), r2=40(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=129(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 419
LDI r1, 96
LDI r2, 40
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 129
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
