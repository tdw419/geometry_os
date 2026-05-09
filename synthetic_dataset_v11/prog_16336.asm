; DESCRIPTION: Places a black 93x19 rectangle at position (129, 101).
; PLAN: r0=129(x), r1=101(y), r2=93(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 101
LDI r2, 93
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
