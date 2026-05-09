; DESCRIPTION: Places a black 76x28 rectangle at position (42, 5).
; PLAN: r0=42(x), r1=5(y), r2=76(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 5
LDI r2, 76
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
