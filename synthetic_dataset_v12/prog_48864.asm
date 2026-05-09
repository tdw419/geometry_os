; DESCRIPTION: Renders a purple box of size 26x113 starting at (224, 63).
; PLAN: r0=224(x), r1=63(y), r2=26(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 63
LDI r2, 26
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
