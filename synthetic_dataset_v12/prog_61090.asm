; DESCRIPTION: Places a white line segment connecting (337, 242) to (316, 68).
; PLAN: r0=337(x1), r1=242(y1), r2=316(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 242
LDI r2, 316
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
