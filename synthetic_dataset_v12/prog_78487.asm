; DESCRIPTION: Renders a green box of size 85x76 starting at (421, 75).
; PLAN: r0=421(x), r1=75(y), r2=85(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 75
LDI r2, 85
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
