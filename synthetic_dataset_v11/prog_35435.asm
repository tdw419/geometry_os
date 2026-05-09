; DESCRIPTION: Renders a black box of size 14x42 starting at (144, 64).
; PLAN: r0=144(x), r1=64(y), r2=14(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 64
LDI r2, 14
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
