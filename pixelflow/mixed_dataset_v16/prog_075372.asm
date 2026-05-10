; DESCRIPTION: Draws a orange line from (18, 93) to (179, 143).
; PLAN: r0=18(x1), r1=93(y1), r2=179(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 93
LDI r2, 179
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
