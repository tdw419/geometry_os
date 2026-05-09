; DESCRIPTION: Draws a white line from (112, 176) to (28, 221).
; PLAN: r0=112(x1), r1=176(y1), r2=28(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 176
LDI r2, 28
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
