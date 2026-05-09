; DESCRIPTION: Renders a blue box of size 28x88 starting at (236, 164).
; PLAN: r0=236(x), r1=164(y), r2=28(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 164
LDI r2, 28
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
