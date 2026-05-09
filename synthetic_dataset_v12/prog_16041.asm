; DESCRIPTION: Renders a cyan line between points (501, 141) and (339, 189).
; PLAN: r0=501(x1), r1=141(y1), r2=339(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 141
LDI r2, 339
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
