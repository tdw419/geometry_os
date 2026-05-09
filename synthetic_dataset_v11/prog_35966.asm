; DESCRIPTION: Places a white line segment connecting (128, 132) to (45, 57).
; PLAN: r0=128(x1), r1=132(y1), r2=45(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 132
LDI r2, 45
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
