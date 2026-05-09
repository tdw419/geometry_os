; DESCRIPTION: Draws a white line from (189, 76) to (77, 146).
; PLAN: r0=189(x1), r1=76(y1), r2=77(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 76
LDI r2, 77
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
