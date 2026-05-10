; DESCRIPTION: Places a white line segment connecting (280, 154) to (379, 252).
; PLAN: r0=280(x1), r1=154(y1), r2=379(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 154
LDI r2, 379
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
