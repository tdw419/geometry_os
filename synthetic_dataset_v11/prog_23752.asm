; DESCRIPTION: Draws a white line from (92, 239) to (201, 203).
; PLAN: r0=92(x1), r1=239(y1), r2=201(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 239
LDI r2, 201
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
