; DESCRIPTION: Places a green line segment connecting (87, 157) to (42, 109).
; PLAN: r0=87(x1), r1=157(y1), r2=42(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 157
LDI r2, 42
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
