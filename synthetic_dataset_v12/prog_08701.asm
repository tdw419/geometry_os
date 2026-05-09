; DESCRIPTION: Draws a white line from (467, 78) to (17, 138).
; PLAN: r0=467(x1), r1=78(y1), r2=17(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 78
LDI r2, 17
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
