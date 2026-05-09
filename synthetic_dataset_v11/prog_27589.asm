; DESCRIPTION: Renders a cyan line between points (204, 159) and (243, 158).
; PLAN: r0=204(x1), r1=159(y1), r2=243(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 159
LDI r2, 243
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
