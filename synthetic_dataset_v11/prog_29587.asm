; DESCRIPTION: Places a white line segment connecting (246, 254) to (5, 242).
; PLAN: r0=246(x1), r1=254(y1), r2=5(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 254
LDI r2, 5
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
