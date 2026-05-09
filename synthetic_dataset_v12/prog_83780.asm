; DESCRIPTION: Places a black line segment connecting (66, 154) to (173, 63).
; PLAN: r0=66(x1), r1=154(y1), r2=173(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 154
LDI r2, 173
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
