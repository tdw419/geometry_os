; DESCRIPTION: Draws a white line from (67, 118) to (170, 192).
; PLAN: r0=67(x1), r1=118(y1), r2=170(x2), r3=192(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 118
LDI r2, 170
LDI r3, 192
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
