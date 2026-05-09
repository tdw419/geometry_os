; DESCRIPTION: Draws a cyan line from (129, 237) to (41, 93).
; PLAN: r0=129(x1), r1=237(y1), r2=41(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 237
LDI r2, 41
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
