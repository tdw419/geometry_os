; DESCRIPTION: Renders a cyan line between points (319, 83) and (511, 97).
; PLAN: r0=319(x1), r1=83(y1), r2=511(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 83
LDI r2, 511
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
