; DESCRIPTION: Draws a white line from (259, 11) to (447, 46).
; PLAN: r0=259(x1), r1=11(y1), r2=447(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 11
LDI r2, 447
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
