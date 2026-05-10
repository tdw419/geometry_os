; DESCRIPTION: Draws a black line from (428, 250) to (411, 152).
; PLAN: r0=428(x1), r1=250(y1), r2=411(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 250
LDI r2, 411
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
