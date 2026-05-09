; DESCRIPTION: Renders a red line between points (429, 128) and (46, 156).
; PLAN: r0=429(x1), r1=128(y1), r2=46(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 128
LDI r2, 46
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
