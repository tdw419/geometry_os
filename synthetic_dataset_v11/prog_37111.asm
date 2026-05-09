; DESCRIPTION: Places a yellow 74x53 rectangle at position (129, 19).
; PLAN: r0=129(x), r1=19(y), r2=74(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 19
LDI r2, 74
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
