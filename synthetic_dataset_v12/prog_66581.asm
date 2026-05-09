; DESCRIPTION: Places a white line segment connecting (281, 128) to (359, 80).
; PLAN: r0=281(x1), r1=128(y1), r2=359(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 128
LDI r2, 359
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
