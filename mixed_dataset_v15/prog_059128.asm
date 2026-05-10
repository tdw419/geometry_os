; DESCRIPTION: Places a cyan 19x42 rectangle at position (72, 23).
; PLAN: r0=72(x), r1=23(y), r2=19(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 23
LDI r2, 19
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
