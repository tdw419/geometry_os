; DESCRIPTION: Renders a green line between points (58, 175) and (66, 153).
; PLAN: r0=58(x1), r1=175(y1), r2=66(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 175
LDI r2, 66
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
