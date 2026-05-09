; DESCRIPTION: Draws a white line from (23, 26) to (148, 207).
; PLAN: r0=23(x1), r1=26(y1), r2=148(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 26
LDI r2, 148
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
