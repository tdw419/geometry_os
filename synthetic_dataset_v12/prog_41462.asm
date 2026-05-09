; DESCRIPTION: Renders a cyan line between points (58, 229) and (297, 250).
; PLAN: r0=58(x1), r1=229(y1), r2=297(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 229
LDI r2, 297
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
