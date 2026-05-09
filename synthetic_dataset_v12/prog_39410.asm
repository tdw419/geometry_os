; DESCRIPTION: Renders a green box of size 11x75 starting at (428, 49).
; PLAN: r0=428(x), r1=49(y), r2=11(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 49
LDI r2, 11
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
