; DESCRIPTION: Places a cyan 42x61 rectangle at position (78, 43).
; PLAN: r0=78(x), r1=43(y), r2=42(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 43
LDI r2, 42
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
