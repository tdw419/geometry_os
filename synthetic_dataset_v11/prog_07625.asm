; DESCRIPTION: Renders a magenta line between points (61, 209) and (122, 209).
; PLAN: r0=61(x1), r1=209(y1), r2=122(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 209
LDI r2, 122
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
