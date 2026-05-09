; DESCRIPTION: Draws a white line from (175, 157) to (89, 57).
; PLAN: r0=175(x1), r1=157(y1), r2=89(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 157
LDI r2, 89
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
