; DESCRIPTION: Draws a white line from (323, 125) to (298, 88).
; PLAN: r0=323(x1), r1=125(y1), r2=298(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 125
LDI r2, 298
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
