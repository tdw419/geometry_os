; DESCRIPTION: Places a red 53x80 rectangle at position (345, 101).
; PLAN: r0=345(x), r1=101(y), r2=53(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 101
LDI r2, 53
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
