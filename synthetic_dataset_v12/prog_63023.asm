; DESCRIPTION: Draws a white line from (66, 58) to (13, 133).
; PLAN: r0=66(x1), r1=58(y1), r2=13(x2), r3=133(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 58
LDI r2, 13
LDI r3, 133
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
