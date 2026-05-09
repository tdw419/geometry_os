; DESCRIPTION: Renders a magenta line between points (426, 152) and (120, 56).
; PLAN: r0=426(x1), r1=152(y1), r2=120(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 152
LDI r2, 120
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
