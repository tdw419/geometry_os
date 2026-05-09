; DESCRIPTION: Renders a green line between points (55, 242) and (220, 74).
; PLAN: r0=55(x1), r1=242(y1), r2=220(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 242
LDI r2, 220
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
