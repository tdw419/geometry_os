; DESCRIPTION: Renders a magenta line between points (329, 22) and (439, 43).
; PLAN: r0=329(x1), r1=22(y1), r2=439(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 22
LDI r2, 439
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
