; DESCRIPTION: Draws a black line from (79, 116) to (362, 176).
; PLAN: r0=79(x1), r1=116(y1), r2=362(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 116
LDI r2, 362
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
