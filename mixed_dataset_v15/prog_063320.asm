; DESCRIPTION: Renders a magenta line between points (253, 46) and (166, 57).
; PLAN: r0=253(x1), r1=46(y1), r2=166(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 46
LDI r2, 166
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
