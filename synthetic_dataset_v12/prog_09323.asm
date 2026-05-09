; DESCRIPTION: Renders a blue box of size 27x56 starting at (402, 199).
; PLAN: r0=402(x), r1=199(y), r2=27(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 199
LDI r2, 27
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
