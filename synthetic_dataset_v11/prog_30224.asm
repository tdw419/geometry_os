; DESCRIPTION: Renders a blue box of size 42x107 starting at (208, 128).
; PLAN: r0=208(x), r1=128(y), r2=42(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 128
LDI r2, 42
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
