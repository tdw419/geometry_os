; DESCRIPTION: Renders a blue box of size 33x28 starting at (283, 115).
; PLAN: r0=283(x), r1=115(y), r2=33(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 115
LDI r2, 33
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
