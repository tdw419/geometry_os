; DESCRIPTION: Draws a black line from (116, 100) to (280, 207).
; PLAN: r0=116(x1), r1=100(y1), r2=280(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 100
LDI r2, 280
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
