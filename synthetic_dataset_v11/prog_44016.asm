; DESCRIPTION: Draws a white line from (69, 40) to (25, 64).
; PLAN: r0=69(x1), r1=40(y1), r2=25(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 40
LDI r2, 25
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
