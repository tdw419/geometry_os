; DESCRIPTION: Places a green line segment connecting (103, 42) to (58, 30).
; PLAN: r0=103(x1), r1=42(y1), r2=58(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 42
LDI r2, 58
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
