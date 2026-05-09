; DESCRIPTION: Renders a magenta box of size 64x32 starting at (9, 188).
; PLAN: r0=9(x), r1=188(y), r2=64(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 188
LDI r2, 64
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
