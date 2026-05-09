; DESCRIPTION: Renders a green line between points (306, 70) and (288, 156).
; PLAN: r0=306(x1), r1=70(y1), r2=288(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 70
LDI r2, 288
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
