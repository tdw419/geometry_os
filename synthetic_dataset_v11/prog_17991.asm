; DESCRIPTION: Renders a green line between points (150, 143) and (183, 78).
; PLAN: r0=150(x1), r1=143(y1), r2=183(x2), r3=78(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 143
LDI r2, 183
LDI r3, 78
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
