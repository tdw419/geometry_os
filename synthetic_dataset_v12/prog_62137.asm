; DESCRIPTION: Renders a magenta box of size 35x27 starting at (64, 6).
; PLAN: r0=64(x), r1=6(y), r2=35(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 6
LDI r2, 35
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
