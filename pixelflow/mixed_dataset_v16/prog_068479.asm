; DESCRIPTION: Places a black line segment connecting (299, 79) to (439, 42).
; PLAN: r0=299(x1), r1=79(y1), r2=439(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 79
LDI r2, 439
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
