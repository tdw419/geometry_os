; DESCRIPTION: Places a yellow 25x53 rectangle at position (381, 1).
; PLAN: r0=381(x), r1=1(y), r2=25(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 1
LDI r2, 25
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
