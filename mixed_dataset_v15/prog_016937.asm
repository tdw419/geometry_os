; DESCRIPTION: Renders a cyan line between points (22, 69) and (430, 199).
; PLAN: r0=22(x1), r1=69(y1), r2=430(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 69
LDI r2, 430
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
