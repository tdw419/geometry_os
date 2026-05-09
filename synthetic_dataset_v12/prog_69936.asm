; DESCRIPTION: Renders a magenta box of size 30x52 starting at (224, 151).
; PLAN: r0=224(x), r1=151(y), r2=30(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 151
LDI r2, 30
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
