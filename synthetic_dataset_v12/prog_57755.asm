; DESCRIPTION: Places a yellow 15x42 rectangle at position (379, 1).
; PLAN: r0=379(x), r1=1(y), r2=15(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 1
LDI r2, 15
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
