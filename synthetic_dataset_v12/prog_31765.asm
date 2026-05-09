; DESCRIPTION: Places a black line segment connecting (182, 42) to (511, 90).
; PLAN: r0=182(x1), r1=42(y1), r2=511(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 42
LDI r2, 511
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
