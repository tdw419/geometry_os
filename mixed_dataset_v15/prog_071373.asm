; DESCRIPTION: Renders a cyan line between points (488, 122) and (290, 57).
; PLAN: r0=488(x1), r1=122(y1), r2=290(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 122
LDI r2, 290
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
