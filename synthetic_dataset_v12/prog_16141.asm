; DESCRIPTION: Renders a red line between points (161, 39) and (509, 250).
; PLAN: r0=161(x1), r1=39(y1), r2=509(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 39
LDI r2, 509
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
