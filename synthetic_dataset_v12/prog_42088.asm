; DESCRIPTION: Renders a blue box of size 80x42 starting at (114, 87).
; PLAN: r0=114(x), r1=87(y), r2=80(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 87
LDI r2, 80
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
