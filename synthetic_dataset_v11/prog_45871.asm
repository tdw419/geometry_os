; DESCRIPTION: Renders a cyan line between points (121, 155) and (19, 176).
; PLAN: r0=121(x1), r1=155(y1), r2=19(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 155
LDI r2, 19
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
