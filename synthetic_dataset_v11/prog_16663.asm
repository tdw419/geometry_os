; DESCRIPTION: Places a white line segment connecting (2, 35) to (195, 42).
; PLAN: r0=2(x1), r1=35(y1), r2=195(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 35
LDI r2, 195
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
