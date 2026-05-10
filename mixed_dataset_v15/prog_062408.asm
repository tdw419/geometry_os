; DESCRIPTION: Renders a cyan line segment connecting (301, 109) to (270, 199).
; PLAN: r0=301(x1), r1=109(y1), r2=270(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 109
LDI r2, 270
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
