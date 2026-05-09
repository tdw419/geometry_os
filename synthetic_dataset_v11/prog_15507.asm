; DESCRIPTION: Renders a magenta line between points (79, 165) and (23, 86).
; PLAN: r0=79(x1), r1=165(y1), r2=23(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 165
LDI r2, 23
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
