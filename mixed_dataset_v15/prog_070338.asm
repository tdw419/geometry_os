; DESCRIPTION: Places a yellow 53x81 rectangle at position (85, 68).
; PLAN: r0=85(x), r1=68(y), r2=53(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 68
LDI r2, 53
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
