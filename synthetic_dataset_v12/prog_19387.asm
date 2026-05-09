; DESCRIPTION: Renders a cyan line between points (181, 9) and (304, 80).
; PLAN: r0=181(x1), r1=9(y1), r2=304(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 9
LDI r2, 304
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
