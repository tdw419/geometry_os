; DESCRIPTION: Renders a blue line between points (281, 59) and (246, 23).
; PLAN: r0=281(x1), r1=59(y1), r2=246(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 59
LDI r2, 246
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
