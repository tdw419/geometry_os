; DESCRIPTION: Renders a magenta line between points (18, 194) and (9, 198).
; PLAN: r0=18(x1), r1=194(y1), r2=9(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 194
LDI r2, 9
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
