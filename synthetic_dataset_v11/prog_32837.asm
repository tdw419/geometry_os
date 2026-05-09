; DESCRIPTION: Places a yellow 74x53 rectangle at position (139, 178).
; PLAN: r0=139(x), r1=178(y), r2=74(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 178
LDI r2, 74
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
