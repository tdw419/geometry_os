; DESCRIPTION: Places a magenta line segment connecting (41, 63) to (176, 253).
; PLAN: r0=41(x1), r1=63(y1), r2=176(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 63
LDI r2, 176
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
