; DESCRIPTION: Renders a cyan line between points (264, 12) and (390, 49).
; PLAN: r0=264(x1), r1=12(y1), r2=390(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 12
LDI r2, 390
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
