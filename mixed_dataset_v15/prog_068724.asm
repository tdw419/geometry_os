; DESCRIPTION: Draws a white line from (402, 175) to (366, 134).
; PLAN: r0=402(x1), r1=175(y1), r2=366(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 175
LDI r2, 366
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
