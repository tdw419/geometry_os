; DESCRIPTION: Renders a magenta line between points (28, 53) and (260, 198).
; PLAN: r0=28(x1), r1=53(y1), r2=260(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 53
LDI r2, 260
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
