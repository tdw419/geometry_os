; DESCRIPTION: Renders a cyan line between points (44, 230) and (222, 58).
; PLAN: r0=44(x1), r1=230(y1), r2=222(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 230
LDI r2, 222
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
