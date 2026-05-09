; DESCRIPTION: Places a black 42x61 rectangle at position (47, 14).
; PLAN: r0=47(x), r1=14(y), r2=42(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 14
LDI r2, 42
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
