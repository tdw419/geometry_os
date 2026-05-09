; DESCRIPTION: Draws a white line from (434, 158) to (89, 113).
; PLAN: r0=434(x1), r1=158(y1), r2=89(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 158
LDI r2, 89
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
