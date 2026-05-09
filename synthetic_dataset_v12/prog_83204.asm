; DESCRIPTION: Places a yellow 95x13 rectangle at position (158, 64).
; PLAN: r0=158(x), r1=64(y), r2=95(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 64
LDI r2, 95
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
