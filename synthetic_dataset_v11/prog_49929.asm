; DESCRIPTION: Renders a blue box of size 16x56 starting at (211, 87).
; PLAN: r0=211(x), r1=87(y), r2=16(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 87
LDI r2, 16
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
