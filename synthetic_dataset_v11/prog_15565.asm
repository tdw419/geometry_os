; DESCRIPTION: Draws a black line from (79, 152) to (164, 31).
; PLAN: r0=79(x1), r1=152(y1), r2=164(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 152
LDI r2, 164
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
