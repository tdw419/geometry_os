; DESCRIPTION: Renders a green box of size 18x69 starting at (75, 31).
; PLAN: r0=75(x), r1=31(y), r2=18(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 31
LDI r2, 18
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
