; DESCRIPTION: Renders a green box of size 86x20 starting at (11, 63).
; PLAN: r0=11(x), r1=63(y), r2=86(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 63
LDI r2, 86
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
