; DESCRIPTION: Renders a white line between points (209, 37) and (276, 85).
; PLAN: r0=209(x1), r1=37(y1), r2=276(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 37
LDI r2, 276
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
