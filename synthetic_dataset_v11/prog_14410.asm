; DESCRIPTION: Places a black 85x67 rectangle at position (42, 50).
; PLAN: r0=42(x), r1=50(y), r2=85(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 50
LDI r2, 85
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
