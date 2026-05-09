; DESCRIPTION: Places a black 42x24 rectangle at position (214, 63).
; PLAN: r0=214(x), r1=63(y), r2=42(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 63
LDI r2, 42
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
