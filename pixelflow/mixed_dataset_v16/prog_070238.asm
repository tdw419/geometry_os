; DESCRIPTION: Renders a white line between points (57, 176) and (4, 3).
; PLAN: r0=57(x1), r1=176(y1), r2=4(x2), r3=3(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 176
LDI r2, 4
LDI r3, 3
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
