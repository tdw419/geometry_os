; DESCRIPTION: Draws a white line from (223, 236) to (230, 1).
; PLAN: r0=223(x1), r1=236(y1), r2=230(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 236
LDI r2, 230
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
