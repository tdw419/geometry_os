; DESCRIPTION: Renders a purple box of size 21x32 starting at (42, 87).
; PLAN: r0=42(x), r1=87(y), r2=21(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 87
LDI r2, 21
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
