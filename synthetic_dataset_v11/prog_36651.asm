; DESCRIPTION: Draws a orange line from (138, 236) to (173, 119).
; PLAN: r0=138(x1), r1=236(y1), r2=173(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 236
LDI r2, 173
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
