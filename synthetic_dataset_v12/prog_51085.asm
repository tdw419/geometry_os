; DESCRIPTION: Draws a purple line from (104, 173) to (52, 187).
; PLAN: r0=104(x1), r1=173(y1), r2=52(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 173
LDI r2, 52
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
