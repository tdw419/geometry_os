; DESCRIPTION: Draws a orange line from (196, 135) to (365, 180).
; PLAN: r0=196(x1), r1=135(y1), r2=365(x2), r3=180(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 135
LDI r2, 365
LDI r3, 180
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
