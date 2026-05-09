; DESCRIPTION: Renders a blue box of size 56x64 starting at (61, 87).
; PLAN: r0=61(x), r1=87(y), r2=56(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 87
LDI r2, 56
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
