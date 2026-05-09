; DESCRIPTION: Renders a green line between points (187, 15) and (21, 84).
; PLAN: r0=187(x1), r1=15(y1), r2=21(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 15
LDI r2, 21
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
