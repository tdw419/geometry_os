; DESCRIPTION: Renders a cyan line between points (488, 201) and (430, 175).
; PLAN: r0=488(x1), r1=201(y1), r2=430(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 201
LDI r2, 430
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
