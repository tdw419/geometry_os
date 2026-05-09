; DESCRIPTION: Draws a white line from (32, 22) to (437, 199).
; PLAN: r0=32(x1), r1=22(y1), r2=437(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 22
LDI r2, 437
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
