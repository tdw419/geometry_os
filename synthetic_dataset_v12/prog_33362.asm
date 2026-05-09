; DESCRIPTION: Renders a magenta line between points (27, 142) and (283, 240).
; PLAN: r0=27(x1), r1=142(y1), r2=283(x2), r3=240(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 142
LDI r2, 283
LDI r3, 240
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
