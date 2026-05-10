; DESCRIPTION: Renders a purple box of size 32x42 starting at (210, 145).
; PLAN: r0=210(x), r1=145(y), r2=32(width), r3=42(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 145
LDI r2, 32
LDI r3, 42
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
