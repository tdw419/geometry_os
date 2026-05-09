; DESCRIPTION: Draws a white line from (210, 84) to (189, 202).
; PLAN: r0=210(x1), r1=84(y1), r2=189(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 84
LDI r2, 189
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
