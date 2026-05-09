; DESCRIPTION: Renders a cyan line between points (261, 131) and (34, 189).
; PLAN: r0=261(x1), r1=131(y1), r2=34(x2), r3=189(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 131
LDI r2, 34
LDI r3, 189
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
