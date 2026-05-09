; DESCRIPTION: Renders a green line between points (159, 170) and (228, 179).
; PLAN: r0=159(x1), r1=170(y1), r2=228(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 170
LDI r2, 228
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
