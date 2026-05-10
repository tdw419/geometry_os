; DESCRIPTION: Composite: Draws a purple line from (313, 196) to (384, 217) then Places a red 12x85 rectangle at position (432, 51).
; PLAN: r0=313(x1), r1=196(y1), r2=384(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=51(y), r7=12(width), r8=85(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 196
LDI r2, 384
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 51
LDI r7, 12
LDI r8, 85
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
