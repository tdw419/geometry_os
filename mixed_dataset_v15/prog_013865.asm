; DESCRIPTION: Draws a orange line from (486, 164) to (173, 161).
; PLAN: r0=486(x1), r1=164(y1), r2=173(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 164
LDI r2, 173
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
