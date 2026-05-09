; DESCRIPTION: Places a cyan 58x69 rectangle at position (337, 158).
; PLAN: r0=337(x), r1=158(y), r2=58(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 158
LDI r2, 58
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
