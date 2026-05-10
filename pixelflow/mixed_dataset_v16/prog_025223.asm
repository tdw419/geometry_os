; DESCRIPTION: Renders a green line between points (460, 84) and (84, 207).
; PLAN: r0=460(x1), r1=84(y1), r2=84(x2), r3=207(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 84
LDI r2, 84
LDI r3, 207
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
