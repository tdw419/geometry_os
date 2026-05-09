; DESCRIPTION: Renders a cyan line between points (34, 104) and (313, 179).
; PLAN: r0=34(x1), r1=104(y1), r2=313(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 104
LDI r2, 313
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
