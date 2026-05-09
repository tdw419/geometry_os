; DESCRIPTION: Places a blue 62x115 rectangle at position (61, 26).
; PLAN: r0=61(x), r1=26(y), r2=62(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 26
LDI r2, 62
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
