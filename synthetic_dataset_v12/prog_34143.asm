; DESCRIPTION: Renders a black box of size 115x16 starting at (14, 42).
; PLAN: r0=14(x), r1=42(y), r2=115(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 42
LDI r2, 115
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
