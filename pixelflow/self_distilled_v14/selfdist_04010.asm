; DESCRIPTION: Draws a white line from (336, 97) to (197, 0).
; PLAN: r0=336(x1), r1=97(y1), r2=197(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 97
LDI r2, 197
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
