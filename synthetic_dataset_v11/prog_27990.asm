; DESCRIPTION: Renders a orange line between points (42, 249) and (161, 11).
; PLAN: r0=42(x1), r1=249(y1), r2=161(x2), r3=11(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 249
LDI r2, 161
LDI r3, 11
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
