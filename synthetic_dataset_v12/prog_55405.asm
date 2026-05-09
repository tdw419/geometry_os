; DESCRIPTION: Draws a white line from (310, 57) to (27, 105).
; PLAN: r0=310(x1), r1=57(y1), r2=27(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 57
LDI r2, 27
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
