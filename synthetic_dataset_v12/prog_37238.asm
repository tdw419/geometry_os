; DESCRIPTION: Places a yellow 16x16 rectangle at position (30, 158).
; PLAN: r0=30(x), r1=158(y), r2=16(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 158
LDI r2, 16
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
