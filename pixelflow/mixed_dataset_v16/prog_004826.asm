; DESCRIPTION: Composite: Places a white 40x12 rectangle at position (19, 214) then Places a yellow line segment connecting (355, 211) to (194, 145).
; PLAN: r0=19(x), r1=214(y), r2=40(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=211(y1), r7=194(x2), r8=145(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 214
LDI r2, 40
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 211
LDI r7, 194
LDI r8, 145
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
