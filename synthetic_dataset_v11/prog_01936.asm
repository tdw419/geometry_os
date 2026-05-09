; DESCRIPTION: Draws a cyan line from (139, 170) to (225, 155).
; PLAN: r0=139(x1), r1=170(y1), r2=225(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 170
LDI r2, 225
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
