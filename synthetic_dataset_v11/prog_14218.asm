; DESCRIPTION: Places a black 73x86 rectangle at position (129, 74).
; PLAN: r0=129(x), r1=74(y), r2=73(width), r3=86(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 74
LDI r2, 73
LDI r3, 86
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
