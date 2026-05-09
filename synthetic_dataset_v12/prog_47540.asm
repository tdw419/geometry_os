; DESCRIPTION: Draws a white line from (38, 137) to (258, 240).
; PLAN: r0=38(x1), r1=137(y1), r2=258(x2), r3=240(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 137
LDI r2, 258
LDI r3, 240
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
