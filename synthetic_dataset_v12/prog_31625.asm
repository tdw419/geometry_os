; DESCRIPTION: Renders a cyan line between points (24, 89) and (326, 101).
; PLAN: r0=24(x1), r1=89(y1), r2=326(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 89
LDI r2, 326
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
