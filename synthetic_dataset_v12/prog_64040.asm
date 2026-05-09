; DESCRIPTION: Renders a orange line between points (197, 146) and (35, 247).
; PLAN: r0=197(x1), r1=146(y1), r2=35(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 146
LDI r2, 35
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
