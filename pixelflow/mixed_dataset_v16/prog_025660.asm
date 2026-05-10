; DESCRIPTION: Draws a white line from (258, 80) to (425, 13).
; PLAN: r0=258(x1), r1=80(y1), r2=425(x2), r3=13(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 80
LDI r2, 425
LDI r3, 13
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
