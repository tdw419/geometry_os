; DESCRIPTION: Renders a blue line between points (196, 1) and (197, 156).
; PLAN: r0=196(x1), r1=1(y1), r2=197(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 1
LDI r2, 197
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
