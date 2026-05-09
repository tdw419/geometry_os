; DESCRIPTION: Places a red line segment connecting (137, 42) to (64, 48).
; PLAN: r0=137(x1), r1=42(y1), r2=64(x2), r3=48(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 42
LDI r2, 64
LDI r3, 48
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
