; DESCRIPTION: Renders a white line between points (21, 125) and (230, 52).
; PLAN: r0=21(x1), r1=125(y1), r2=230(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 125
LDI r2, 230
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
