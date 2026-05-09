; DESCRIPTION: Renders a black box of size 100x42 starting at (100, 60).
; PLAN: r0=100(x), r1=60(y), r2=100(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 60
LDI r2, 100
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
