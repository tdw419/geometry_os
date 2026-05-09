; DESCRIPTION: Renders a black box of size 44x62 starting at (56, 42).
; PLAN: r0=56(x), r1=42(y), r2=44(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 42
LDI r2, 44
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
