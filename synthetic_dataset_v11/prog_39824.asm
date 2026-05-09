; DESCRIPTION: Draws a white line from (234, 249) to (20, 251).
; PLAN: r0=234(x1), r1=249(y1), r2=20(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 249
LDI r2, 20
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
