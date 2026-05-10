; DESCRIPTION: Draws a white line from (277, 172) to (86, 239).
; PLAN: r0=277(x1), r1=172(y1), r2=86(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 172
LDI r2, 86
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
