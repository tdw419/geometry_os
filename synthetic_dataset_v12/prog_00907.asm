; DESCRIPTION: Renders a cyan line between points (230, 75) and (184, 181).
; PLAN: r0=230(x1), r1=75(y1), r2=184(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 75
LDI r2, 184
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
