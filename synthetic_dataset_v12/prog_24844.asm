; DESCRIPTION: Places a black 115x74 rectangle at position (113, 123).
; PLAN: r0=113(x), r1=123(y), r2=115(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 123
LDI r2, 115
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
