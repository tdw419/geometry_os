; DESCRIPTION: Renders a orange line between points (365, 171) and (102, 32).
; PLAN: r0=365(x1), r1=171(y1), r2=102(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 171
LDI r2, 102
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
