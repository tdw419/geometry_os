; DESCRIPTION: Draws a white line from (333, 226) to (19, 78).
; PLAN: r0=333(x1), r1=226(y1), r2=19(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 226
LDI r2, 19
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
