; DESCRIPTION: Renders a cyan line between points (358, 136) and (442, 98).
; PLAN: r0=358(x1), r1=136(y1), r2=442(x2), r3=98(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 136
LDI r2, 442
LDI r3, 98
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
