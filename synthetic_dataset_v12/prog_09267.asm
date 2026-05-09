; DESCRIPTION: Renders a magenta line between points (491, 63) and (367, 104).
; PLAN: r0=491(x1), r1=63(y1), r2=367(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 63
LDI r2, 367
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
