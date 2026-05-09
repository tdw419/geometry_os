; DESCRIPTION: Places a white line segment connecting (95, 108) to (226, 128).
; PLAN: r0=95(x1), r1=108(y1), r2=226(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 108
LDI r2, 226
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
