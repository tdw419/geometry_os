; DESCRIPTION: Draws a black line from (510, 152) to (145, 161).
; PLAN: r0=510(x1), r1=152(y1), r2=145(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 152
LDI r2, 145
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
