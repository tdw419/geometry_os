; DESCRIPTION: Places a green line segment connecting (106, 126) to (42, 89).
; PLAN: r0=106(x1), r1=126(y1), r2=42(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 126
LDI r2, 42
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
