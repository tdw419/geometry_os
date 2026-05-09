; DESCRIPTION: Places a orange line segment connecting (263, 213) to (128, 45).
; PLAN: r0=263(x1), r1=213(y1), r2=128(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 213
LDI r2, 128
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
