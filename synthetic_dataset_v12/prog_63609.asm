; DESCRIPTION: Renders a cyan line between points (26, 88) and (313, 158).
; PLAN: r0=26(x1), r1=88(y1), r2=313(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 88
LDI r2, 313
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
