; DESCRIPTION: Renders a black box of size 103x39 starting at (214, 42).
; PLAN: r0=214(x), r1=42(y), r2=103(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 42
LDI r2, 103
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
