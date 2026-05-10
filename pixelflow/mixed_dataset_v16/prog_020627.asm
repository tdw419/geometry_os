; DESCRIPTION: Renders a cyan line between points (104, 221) and (259, 22).
; PLAN: r0=104(x1), r1=221(y1), r2=259(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 221
LDI r2, 259
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
