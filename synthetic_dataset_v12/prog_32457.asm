; DESCRIPTION: Draws a green line from (2, 81) to (80, 239).
; PLAN: r0=2(x1), r1=81(y1), r2=80(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 81
LDI r2, 80
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
