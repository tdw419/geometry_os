; DESCRIPTION: Places a yellow 26x93 rectangle at position (42, 76).
; PLAN: r0=42(x), r1=76(y), r2=26(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 76
LDI r2, 26
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
