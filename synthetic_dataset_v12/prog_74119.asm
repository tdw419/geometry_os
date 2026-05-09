; DESCRIPTION: Renders a green line between points (488, 90) and (423, 176).
; PLAN: r0=488(x1), r1=90(y1), r2=423(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 90
LDI r2, 423
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
