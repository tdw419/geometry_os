; DESCRIPTION: Places a cyan 42x114 rectangle at position (108, 142).
; PLAN: r0=108(x), r1=142(y), r2=42(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 142
LDI r2, 42
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
