; DESCRIPTION: Composite: Places a purple line segment connecting (51, 219) to (254, 220) then Places a white 97x115 rectangle at position (22, 109).
; PLAN: r0=51(x1), r1=219(y1), r2=254(x2), r3=220(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=109(y), r7=97(width), r8=115(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 219
LDI r2, 254
LDI r3, 220
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 109
LDI r7, 97
LDI r8, 115
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
