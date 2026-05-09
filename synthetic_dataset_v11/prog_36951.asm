; DESCRIPTION: Renders a blue box of size 18x76 starting at (224, 88).
; PLAN: r0=224(x), r1=88(y), r2=18(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 88
LDI r2, 18
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
