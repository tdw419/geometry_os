; DESCRIPTION: Places a black 35x74 rectangle at position (100, 27).
; PLAN: r0=100(x), r1=27(y), r2=35(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 27
LDI r2, 35
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
