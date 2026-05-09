; DESCRIPTION: Draws a white line from (67, 45) to (78, 42).
; PLAN: r0=67(x1), r1=45(y1), r2=78(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 45
LDI r2, 78
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
