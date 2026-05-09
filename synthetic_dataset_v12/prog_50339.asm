; DESCRIPTION: Renders a green line between points (306, 25) and (153, 208).
; PLAN: r0=306(x1), r1=25(y1), r2=153(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 25
LDI r2, 153
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
