; DESCRIPTION: Places a black line segment connecting (329, 117) to (397, 229).
; PLAN: r0=329(x1), r1=117(y1), r2=397(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 117
LDI r2, 397
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
