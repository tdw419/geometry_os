; DESCRIPTION: Draws a white line from (62, 35) to (28, 60).
; PLAN: r0=62(x1), r1=35(y1), r2=28(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 35
LDI r2, 28
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
