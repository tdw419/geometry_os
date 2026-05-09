; DESCRIPTION: Renders a magenta box of size 64x49 starting at (290, 128).
; PLAN: r0=290(x), r1=128(y), r2=64(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 128
LDI r2, 64
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
