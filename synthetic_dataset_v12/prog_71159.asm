; DESCRIPTION: Renders a magenta line between points (268, 43) and (408, 60).
; PLAN: r0=268(x1), r1=43(y1), r2=408(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 43
LDI r2, 408
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
