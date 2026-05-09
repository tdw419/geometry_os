; DESCRIPTION: Draws a white line from (334, 181) to (434, 93).
; PLAN: r0=334(x1), r1=181(y1), r2=434(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 181
LDI r2, 434
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
