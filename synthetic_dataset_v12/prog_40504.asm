; DESCRIPTION: Renders a green line between points (445, 110) and (74, 94).
; PLAN: r0=445(x1), r1=110(y1), r2=74(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 110
LDI r2, 74
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
