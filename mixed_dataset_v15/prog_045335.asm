; DESCRIPTION: Draws a white line from (181, 221) to (29, 161).
; PLAN: r0=181(x1), r1=221(y1), r2=29(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 221
LDI r2, 29
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
