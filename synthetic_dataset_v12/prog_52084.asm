; DESCRIPTION: Renders a yellow line between points (488, 242) and (220, 72).
; PLAN: r0=488(x1), r1=242(y1), r2=220(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 242
LDI r2, 220
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
