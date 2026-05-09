; DESCRIPTION: Renders a blue line between points (213, 28) and (18, 199).
; PLAN: r0=213(x1), r1=28(y1), r2=18(x2), r3=199(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 28
LDI r2, 18
LDI r3, 199
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
