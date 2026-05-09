; DESCRIPTION: Renders a green line between points (65, 72) and (353, 23).
; PLAN: r0=65(x1), r1=72(y1), r2=353(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 72
LDI r2, 353
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
