; DESCRIPTION: Places a black line segment connecting (107, 154) to (151, 42).
; PLAN: r0=107(x1), r1=154(y1), r2=151(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 154
LDI r2, 151
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
