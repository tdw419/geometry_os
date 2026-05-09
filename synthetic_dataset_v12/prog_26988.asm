; DESCRIPTION: Renders a cyan line between points (1, 225) and (258, 97).
; PLAN: r0=1(x1), r1=225(y1), r2=258(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 225
LDI r2, 258
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
