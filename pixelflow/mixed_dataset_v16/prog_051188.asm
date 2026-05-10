; DESCRIPTION: Renders a blue line between points (221, 157) and (279, 113).
; PLAN: r0=221(x1), r1=157(y1), r2=279(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 157
LDI r2, 279
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
