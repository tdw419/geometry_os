; DESCRIPTION: Renders a cyan line between points (86, 170) and (151, 3).
; PLAN: r0=86(x1), r1=170(y1), r2=151(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 170
LDI r2, 151
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
