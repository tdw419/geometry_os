; DESCRIPTION: Renders a cyan line between points (7, 140) and (188, 65).
; PLAN: r0=7(x1), r1=140(y1), r2=188(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 140
LDI r2, 188
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
