; DESCRIPTION: Draws a purple line from (116, 109) to (41, 215).
; PLAN: r0=116(x1), r1=109(y1), r2=41(x2), r3=215(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 109
LDI r2, 41
LDI r3, 215
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
