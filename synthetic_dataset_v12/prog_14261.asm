; DESCRIPTION: Renders a green box of size 13x18 starting at (280, 203).
; PLAN: r0=280(x), r1=203(y), r2=13(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 203
LDI r2, 13
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
