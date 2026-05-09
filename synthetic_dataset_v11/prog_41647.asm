; DESCRIPTION: Places a orange 116x27 rectangle at position (27, 42).
; PLAN: r0=27(x), r1=42(y), r2=116(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 42
LDI r2, 116
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
