; DESCRIPTION: Draws a white line from (497, 40) to (243, 10).
; PLAN: r0=497(x1), r1=40(y1), r2=243(x2), r3=10(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 40
LDI r2, 243
LDI r3, 10
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
