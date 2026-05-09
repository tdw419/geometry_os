; DESCRIPTION: Places a black 30x65 rectangle at position (12, 42).
; PLAN: r0=12(x), r1=42(y), r2=30(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 42
LDI r2, 30
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
