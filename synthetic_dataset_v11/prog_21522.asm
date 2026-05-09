; DESCRIPTION: Renders a green box of size 56x75 starting at (9, 52).
; PLAN: r0=9(x), r1=52(y), r2=56(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 52
LDI r2, 56
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
