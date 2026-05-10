; DESCRIPTION: Renders a cyan line between points (66, 184) and (26, 168).
; PLAN: r0=66(x1), r1=184(y1), r2=26(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 184
LDI r2, 26
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
