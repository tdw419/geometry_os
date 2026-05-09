; DESCRIPTION: Draws a orange line from (444, 33) to (146, 152).
; PLAN: r0=444(x1), r1=33(y1), r2=146(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 33
LDI r2, 146
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
