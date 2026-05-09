; DESCRIPTION: Draws a white line from (327, 38) to (116, 187).
; PLAN: r0=327(x1), r1=38(y1), r2=116(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 38
LDI r2, 116
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
