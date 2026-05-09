; DESCRIPTION: Draws a purple line from (79, 152) to (126, 207).
; PLAN: r0=79(x1), r1=152(y1), r2=126(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 152
LDI r2, 126
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
