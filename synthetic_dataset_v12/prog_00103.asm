; DESCRIPTION: Places a green line segment connecting (121, 61) to (383, 248).
; PLAN: r0=121(x1), r1=61(y1), r2=383(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 61
LDI r2, 383
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
