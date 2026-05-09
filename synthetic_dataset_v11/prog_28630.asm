; DESCRIPTION: Renders a blue line between points (18, 249) and (243, 193).
; PLAN: r0=18(x1), r1=249(y1), r2=243(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 249
LDI r2, 243
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
