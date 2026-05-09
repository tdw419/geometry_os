; DESCRIPTION: Renders a cyan line between points (23, 170) and (80, 199).
; PLAN: r0=23(x1), r1=170(y1), r2=80(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 170
LDI r2, 80
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
