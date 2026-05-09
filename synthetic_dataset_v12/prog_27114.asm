; DESCRIPTION: Renders a blue line between points (88, 125) and (329, 210).
; PLAN: r0=88(x1), r1=125(y1), r2=329(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 125
LDI r2, 329
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
