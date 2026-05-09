; DESCRIPTION: Renders a magenta line between points (291, 59) and (211, 160).
; PLAN: r0=291(x1), r1=59(y1), r2=211(x2), r3=160(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 59
LDI r2, 211
LDI r3, 160
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
