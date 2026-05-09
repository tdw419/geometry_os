; DESCRIPTION: Draws a white line from (324, 12) to (298, 165).
; PLAN: r0=324(x1), r1=12(y1), r2=298(x2), r3=165(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 12
LDI r2, 298
LDI r3, 165
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
