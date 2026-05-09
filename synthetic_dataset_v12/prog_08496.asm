; DESCRIPTION: Draws a white line from (327, 184) to (304, 149).
; PLAN: r0=327(x1), r1=184(y1), r2=304(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 184
LDI r2, 304
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
