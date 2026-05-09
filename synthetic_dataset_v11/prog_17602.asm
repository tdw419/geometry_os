; DESCRIPTION: Renders a blue box of size 15x56 starting at (217, 48).
; PLAN: r0=217(x), r1=48(y), r2=15(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 48
LDI r2, 15
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
