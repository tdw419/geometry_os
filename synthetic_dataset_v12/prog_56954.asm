; DESCRIPTION: Places a yellow 12x81 rectangle at position (397, 115).
; PLAN: r0=397(x), r1=115(y), r2=12(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 115
LDI r2, 12
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
