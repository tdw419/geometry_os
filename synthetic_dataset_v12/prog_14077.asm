; DESCRIPTION: Draws a white line from (28, 207) to (124, 202).
; PLAN: r0=28(x1), r1=207(y1), r2=124(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 207
LDI r2, 124
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
