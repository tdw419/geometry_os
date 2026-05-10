; DESCRIPTION: Draws a white line from (99, 36) to (272, 96).
; PLAN: r0=99(x1), r1=36(y1), r2=272(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 36
LDI r2, 272
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
