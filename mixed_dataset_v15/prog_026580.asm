; DESCRIPTION: Renders a purple box of size 31x42 starting at (397, 196).
; PLAN: r0=397(x), r1=196(y), r2=31(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 196
LDI r2, 31
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
