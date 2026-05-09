; DESCRIPTION: Renders a blue line between points (209, 61) and (279, 134).
; PLAN: r0=209(x1), r1=61(y1), r2=279(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 61
LDI r2, 279
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
