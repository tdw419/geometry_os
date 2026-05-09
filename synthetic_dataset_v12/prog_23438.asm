; DESCRIPTION: Renders a magenta line between points (283, 69) and (312, 166).
; PLAN: r0=283(x1), r1=69(y1), r2=312(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 69
LDI r2, 312
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
