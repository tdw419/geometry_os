; DESCRIPTION: Renders a cyan line between points (115, 170) and (183, 159).
; PLAN: r0=115(x1), r1=170(y1), r2=183(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 170
LDI r2, 183
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
