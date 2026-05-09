; DESCRIPTION: Places a white line segment connecting (121, 197) to (44, 183).
; PLAN: r0=121(x1), r1=197(y1), r2=44(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 197
LDI r2, 44
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
