; DESCRIPTION: Draws a white line from (32, 90) to (157, 61).
; PLAN: r0=32(x1), r1=90(y1), r2=157(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 90
LDI r2, 157
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
