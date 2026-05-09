; DESCRIPTION: Renders a magenta box of size 93x19 starting at (326, 128).
; PLAN: r0=326(x), r1=128(y), r2=93(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 128
LDI r2, 93
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
