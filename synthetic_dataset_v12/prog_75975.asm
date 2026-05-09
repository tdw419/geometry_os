; DESCRIPTION: Draws a white line from (70, 68) to (452, 250).
; PLAN: r0=70(x1), r1=68(y1), r2=452(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 68
LDI r2, 452
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
