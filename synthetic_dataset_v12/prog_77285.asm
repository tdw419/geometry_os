; DESCRIPTION: Draws a white line from (151, 201) to (264, 166).
; PLAN: r0=151(x1), r1=201(y1), r2=264(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 201
LDI r2, 264
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
