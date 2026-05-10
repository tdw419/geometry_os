; DESCRIPTION: Places a white line segment connecting (83, 164) to (144, 128).
; PLAN: r0=83(x1), r1=164(y1), r2=144(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 164
LDI r2, 144
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
