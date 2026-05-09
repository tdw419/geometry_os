; DESCRIPTION: Renders a cyan line between points (488, 240) and (159, 145).
; PLAN: r0=488(x1), r1=240(y1), r2=159(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 240
LDI r2, 159
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
