; DESCRIPTION: Renders a blue line between points (334, 249) and (243, 222).
; PLAN: r0=334(x1), r1=249(y1), r2=243(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 249
LDI r2, 243
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
