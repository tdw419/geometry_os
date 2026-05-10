; DESCRIPTION: Draws a white line from (113, 87) to (451, 246).
; PLAN: r0=113(x1), r1=87(y1), r2=451(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 87
LDI r2, 451
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
