; DESCRIPTION: Draws a blue line from (375, 77) to (502, 13).
; PLAN: r0=375(x1), r1=77(y1), r2=502(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 77
LDI r2, 502
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
