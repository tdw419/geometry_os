; DESCRIPTION: Draws a white line from (396, 254) to (87, 25).
; PLAN: r0=396(x1), r1=254(y1), r2=87(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 254
LDI r2, 87
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
