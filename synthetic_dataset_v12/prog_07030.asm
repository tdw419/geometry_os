; DESCRIPTION: Renders a green box of size 85x28 starting at (33, 63).
; PLAN: r0=33(x), r1=63(y), r2=85(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 63
LDI r2, 85
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
