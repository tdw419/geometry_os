; DESCRIPTION: Draws a white line from (79, 162) to (116, 150).
; PLAN: r0=79(x1), r1=162(y1), r2=116(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 162
LDI r2, 116
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
