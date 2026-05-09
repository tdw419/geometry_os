; DESCRIPTION: Places a green line segment connecting (102, 113) to (42, 211).
; PLAN: r0=102(x1), r1=113(y1), r2=42(x2), r3=211(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 113
LDI r2, 42
LDI r3, 211
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
