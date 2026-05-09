; DESCRIPTION: Renders a black box of size 42x58 starting at (360, 14).
; PLAN: r0=360(x), r1=14(y), r2=42(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 14
LDI r2, 42
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
