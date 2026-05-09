; DESCRIPTION: Draws a orange line from (115, 134) to (461, 213).
; PLAN: r0=115(x1), r1=134(y1), r2=461(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 134
LDI r2, 461
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
