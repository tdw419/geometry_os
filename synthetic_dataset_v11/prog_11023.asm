; DESCRIPTION: Renders a magenta line between points (13, 31) and (23, 253).
; PLAN: r0=13(x1), r1=31(y1), r2=23(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 31
LDI r2, 23
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
