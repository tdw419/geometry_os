; DESCRIPTION: Renders a black line between points (365, 183) and (162, 161).
; PLAN: r0=365(x1), r1=183(y1), r2=162(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 183
LDI r2, 162
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
