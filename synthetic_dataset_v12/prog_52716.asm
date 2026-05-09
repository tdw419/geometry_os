; DESCRIPTION: Places a red line segment connecting (42, 32) to (76, 186).
; PLAN: r0=42(x1), r1=32(y1), r2=76(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 32
LDI r2, 76
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
