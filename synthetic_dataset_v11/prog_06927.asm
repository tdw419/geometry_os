; DESCRIPTION: Renders a blue line between points (160, 23) and (228, 87).
; PLAN: r0=160(x1), r1=23(y1), r2=228(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 23
LDI r2, 228
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
