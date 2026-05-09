; DESCRIPTION: Renders a black line between points (113, 84) and (187, 62).
; PLAN: r0=113(x1), r1=84(y1), r2=187(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 84
LDI r2, 187
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
