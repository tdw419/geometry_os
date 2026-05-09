; DESCRIPTION: Draws a white line from (196, 172) to (70, 18).
; PLAN: r0=196(x1), r1=172(y1), r2=70(x2), r3=18(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 172
LDI r2, 70
LDI r3, 18
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
