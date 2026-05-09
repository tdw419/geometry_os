; DESCRIPTION: Renders a green line between points (350, 81) and (67, 1).
; PLAN: r0=350(x1), r1=81(y1), r2=67(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 81
LDI r2, 67
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
