; DESCRIPTION: Draws a orange line from (82, 29) to (226, 161).
; PLAN: r0=82(x1), r1=29(y1), r2=226(x2), r3=161(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 29
LDI r2, 226
LDI r3, 161
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
