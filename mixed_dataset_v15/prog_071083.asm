; DESCRIPTION: Renders a green line between points (247, 123) and (113, 81).
; PLAN: r0=247(x1), r1=123(y1), r2=113(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 123
LDI r2, 113
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
