; DESCRIPTION: Renders a green line between points (187, 78) and (220, 3).
; PLAN: r0=187(x1), r1=78(y1), r2=220(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 78
LDI r2, 220
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
