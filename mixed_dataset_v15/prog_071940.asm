; DESCRIPTION: Draws a white line from (371, 159) to (272, 194).
; PLAN: r0=371(x1), r1=159(y1), r2=272(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 159
LDI r2, 272
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
