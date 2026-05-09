; DESCRIPTION: Renders a magenta line between points (329, 15) and (345, 178).
; PLAN: r0=329(x1), r1=15(y1), r2=345(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 15
LDI r2, 345
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
