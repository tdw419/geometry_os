; DESCRIPTION: Draws a white line from (184, 151) to (221, 36).
; PLAN: r0=184(x1), r1=151(y1), r2=221(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 151
LDI r2, 221
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
