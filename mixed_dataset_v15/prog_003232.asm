; DESCRIPTION: Places a white line segment connecting (254, 205) to (162, 128).
; PLAN: r0=254(x1), r1=205(y1), r2=162(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 205
LDI r2, 162
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
