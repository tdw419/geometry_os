; DESCRIPTION: Renders a green line between points (187, 75) and (114, 102).
; PLAN: r0=187(x1), r1=75(y1), r2=114(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 75
LDI r2, 114
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
