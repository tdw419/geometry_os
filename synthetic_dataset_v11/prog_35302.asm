; DESCRIPTION: Draws a white line from (177, 176) to (189, 40).
; PLAN: r0=177(x1), r1=176(y1), r2=189(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 176
LDI r2, 189
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
