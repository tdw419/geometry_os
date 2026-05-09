; DESCRIPTION: Renders a cyan line between points (373, 160) and (26, 35).
; PLAN: r0=373(x1), r1=160(y1), r2=26(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 160
LDI r2, 26
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
