; DESCRIPTION: Places a white line segment connecting (218, 61) to (197, 160).
; PLAN: r0=218(x1), r1=61(y1), r2=197(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 61
LDI r2, 197
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
