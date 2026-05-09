; DESCRIPTION: Places a orange 27x103 rectangle at position (379, 148).
; PLAN: r0=379(x), r1=148(y), r2=27(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 148
LDI r2, 27
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
