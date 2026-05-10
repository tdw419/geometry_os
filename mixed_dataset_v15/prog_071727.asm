; DESCRIPTION: Renders a magenta line between points (270, 176) and (421, 208).
; PLAN: r0=270(x1), r1=176(y1), r2=421(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 176
LDI r2, 421
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
