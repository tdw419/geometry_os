; DESCRIPTION: Renders a orange line between points (202, 42) and (149, 156).
; PLAN: r0=202(x1), r1=42(y1), r2=149(x2), r3=156(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 42
LDI r2, 149
LDI r3, 156
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
