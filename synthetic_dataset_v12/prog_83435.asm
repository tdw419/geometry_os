; DESCRIPTION: Draws a white line from (167, 231) to (184, 129).
; PLAN: r0=167(x1), r1=231(y1), r2=184(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 231
LDI r2, 184
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
