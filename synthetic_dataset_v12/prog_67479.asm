; DESCRIPTION: Renders a white box of size 62x26 starting at (42, 128).
; PLAN: r0=42(x), r1=128(y), r2=62(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 128
LDI r2, 62
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
