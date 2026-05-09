; DESCRIPTION: Places a cyan 82x66 rectangle at position (13, 42).
; PLAN: r0=13(x), r1=42(y), r2=82(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 42
LDI r2, 82
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
