; DESCRIPTION: Renders a white line between points (1, 28) and (220, 188).
; PLAN: r0=1(x1), r1=28(y1), r2=220(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 28
LDI r2, 220
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
