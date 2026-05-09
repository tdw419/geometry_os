; DESCRIPTION: Draws a white line from (215, 221) to (34, 54).
; PLAN: r0=215(x1), r1=221(y1), r2=34(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 221
LDI r2, 34
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
