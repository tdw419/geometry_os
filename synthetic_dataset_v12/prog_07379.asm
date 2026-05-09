; DESCRIPTION: Draws a orange line from (107, 135) to (340, 82).
; PLAN: r0=107(x1), r1=135(y1), r2=340(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 135
LDI r2, 340
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
