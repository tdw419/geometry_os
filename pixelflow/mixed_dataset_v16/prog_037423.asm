; DESCRIPTION: Renders a blue box of size 28x86 starting at (254, 88).
; PLAN: r0=254(x), r1=88(y), r2=28(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 88
LDI r2, 28
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
