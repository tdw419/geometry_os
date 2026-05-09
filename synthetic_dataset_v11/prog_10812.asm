; DESCRIPTION: Renders a cyan line between points (101, 125) and (0, 197).
; PLAN: r0=101(x1), r1=125(y1), r2=0(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 125
LDI r2, 0
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
