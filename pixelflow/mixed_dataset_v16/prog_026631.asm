; DESCRIPTION: Places a green 71x14 rectangle at position (101, 115).
; PLAN: r0=101(x), r1=115(y), r2=71(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 115
LDI r2, 71
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
