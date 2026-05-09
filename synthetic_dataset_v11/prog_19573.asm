; DESCRIPTION: Renders a black line between points (98, 242) and (95, 74).
; PLAN: r0=98(x1), r1=242(y1), r2=95(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 242
LDI r2, 95
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
