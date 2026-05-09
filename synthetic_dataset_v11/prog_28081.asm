; DESCRIPTION: Renders a orange line between points (143, 146) and (150, 189).
; PLAN: r0=143(x1), r1=146(y1), r2=150(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 146
LDI r2, 150
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
