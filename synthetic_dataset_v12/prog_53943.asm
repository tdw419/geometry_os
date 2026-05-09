; DESCRIPTION: Renders a black box of size 42x12 starting at (304, 165).
; PLAN: r0=304(x), r1=165(y), r2=42(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 165
LDI r2, 42
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
