; DESCRIPTION: Draws a orange line from (305, 152) to (361, 118).
; PLAN: r0=305(x1), r1=152(y1), r2=361(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 152
LDI r2, 361
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
