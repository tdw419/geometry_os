; DESCRIPTION: Renders a blue line between points (461, 196) and (435, 210).
; PLAN: r0=461(x1), r1=196(y1), r2=435(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 196
LDI r2, 435
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
