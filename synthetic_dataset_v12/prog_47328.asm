; DESCRIPTION: Draws a white line from (466, 168) to (207, 25).
; PLAN: r0=466(x1), r1=168(y1), r2=207(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 168
LDI r2, 207
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
