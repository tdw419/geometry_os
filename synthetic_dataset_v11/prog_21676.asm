; DESCRIPTION: Places a green line segment connecting (236, 42) to (87, 254).
; PLAN: r0=236(x1), r1=42(y1), r2=87(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 42
LDI r2, 87
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
