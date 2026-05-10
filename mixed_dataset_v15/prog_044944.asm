; DESCRIPTION: Places a black 62x48 rectangle at position (371, 42).
; PLAN: r0=371(x), r1=42(y), r2=62(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 42
LDI r2, 62
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
