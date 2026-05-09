; DESCRIPTION: Renders a blue line between points (339, 209) and (488, 193).
; PLAN: r0=339(x1), r1=209(y1), r2=488(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 209
LDI r2, 488
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
