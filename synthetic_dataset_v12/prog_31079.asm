; DESCRIPTION: Draws a magenta line from (217, 120) to (116, 35).
; PLAN: r0=217(x1), r1=120(y1), r2=116(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 120
LDI r2, 116
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
