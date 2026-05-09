; DESCRIPTION: Renders a orange line between points (195, 149) and (42, 6).
; PLAN: r0=195(x1), r1=149(y1), r2=42(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 149
LDI r2, 42
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
