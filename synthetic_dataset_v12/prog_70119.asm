; DESCRIPTION: Draws a white line from (42, 101) to (421, 130).
; PLAN: r0=42(x1), r1=101(y1), r2=421(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 101
LDI r2, 421
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
