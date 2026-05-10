; DESCRIPTION: Renders a magenta line between points (398, 208) and (142, 13).
; PLAN: r0=398(x1), r1=208(y1), r2=142(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 208
LDI r2, 142
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
