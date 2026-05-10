; DESCRIPTION: Renders a blue line between points (240, 157) and (327, 196).
; PLAN: r0=240(x1), r1=157(y1), r2=327(x2), r3=196(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 157
LDI r2, 327
LDI r3, 196
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
