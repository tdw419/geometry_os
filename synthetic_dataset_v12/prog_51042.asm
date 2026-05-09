; DESCRIPTION: Places a white line segment connecting (197, 54) to (36, 159).
; PLAN: r0=197(x1), r1=54(y1), r2=36(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 54
LDI r2, 36
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
