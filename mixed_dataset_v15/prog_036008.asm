; DESCRIPTION: Draws a cyan line from (220, 159) to (136, 129).
; PLAN: r0=220(x1), r1=159(y1), r2=136(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 159
LDI r2, 136
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
