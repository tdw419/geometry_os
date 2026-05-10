; DESCRIPTION: Places a cyan 60x100 rectangle at position (138, 42).
; PLAN: r0=138(x), r1=42(y), r2=60(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 42
LDI r2, 60
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
