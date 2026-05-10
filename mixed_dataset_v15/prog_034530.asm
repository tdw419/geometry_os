; DESCRIPTION: Renders a magenta line between points (447, 165) and (152, 156).
; PLAN: r0=447(x1), r1=165(y1), r2=152(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 165
LDI r2, 152
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
