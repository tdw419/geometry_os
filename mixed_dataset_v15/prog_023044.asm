; DESCRIPTION: Draws a white line from (299, 13) to (113, 22).
; PLAN: r0=299(x1), r1=13(y1), r2=113(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 13
LDI r2, 113
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
