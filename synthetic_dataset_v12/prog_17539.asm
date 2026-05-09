; DESCRIPTION: Places a red 42x34 rectangle at position (126, 116).
; PLAN: r0=126(x), r1=116(y), r2=42(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 116
LDI r2, 42
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
