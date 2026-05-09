; DESCRIPTION: Places a black line segment connecting (97, 248) to (42, 132).
; PLAN: r0=97(x1), r1=248(y1), r2=42(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 248
LDI r2, 42
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
