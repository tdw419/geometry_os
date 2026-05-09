; DESCRIPTION: Places a yellow 43x66 rectangle at position (101, 32).
; PLAN: r0=101(x), r1=32(y), r2=43(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 32
LDI r2, 43
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
