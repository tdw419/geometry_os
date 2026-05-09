; DESCRIPTION: Renders a black box of size 73x110 starting at (154, 42).
; PLAN: r0=154(x), r1=42(y), r2=73(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 42
LDI r2, 73
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
