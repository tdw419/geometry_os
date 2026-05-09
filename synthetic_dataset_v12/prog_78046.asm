; DESCRIPTION: Places a white line segment connecting (501, 45) to (42, 68).
; PLAN: r0=501(x1), r1=45(y1), r2=42(x2), r3=68(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 45
LDI r2, 42
LDI r3, 68
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
