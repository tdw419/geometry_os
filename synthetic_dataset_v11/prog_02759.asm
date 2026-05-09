; DESCRIPTION: Renders a black box of size 42x81 starting at (205, 120).
; PLAN: r0=205(x), r1=120(y), r2=42(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 120
LDI r2, 42
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
