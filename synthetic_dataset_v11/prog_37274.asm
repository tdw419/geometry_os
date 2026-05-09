; DESCRIPTION: Places a black 115x36 rectangle at position (16, 101).
; PLAN: r0=16(x), r1=101(y), r2=115(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 101
LDI r2, 115
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
