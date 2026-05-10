; DESCRIPTION: Draws a white line from (418, 221) to (66, 244).
; PLAN: r0=418(x1), r1=221(y1), r2=66(x2), r3=244(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 221
LDI r2, 66
LDI r3, 244
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
