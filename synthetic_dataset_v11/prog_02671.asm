; DESCRIPTION: Draws a white line from (176, 31) to (0, 140).
; PLAN: r0=176(x1), r1=31(y1), r2=0(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 31
LDI r2, 0
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
