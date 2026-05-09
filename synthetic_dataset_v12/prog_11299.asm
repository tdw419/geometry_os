; DESCRIPTION: Places a white line segment connecting (117, 157) to (197, 227).
; PLAN: r0=117(x1), r1=157(y1), r2=197(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 157
LDI r2, 197
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
