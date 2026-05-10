; DESCRIPTION: Draws a white line from (349, 24) to (272, 61).
; PLAN: r0=349(x1), r1=24(y1), r2=272(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 24
LDI r2, 272
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
