; DESCRIPTION: Renders a cyan line between points (488, 220) and (130, 194).
; PLAN: r0=488(x1), r1=220(y1), r2=130(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 220
LDI r2, 130
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
