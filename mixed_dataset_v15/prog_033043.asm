; DESCRIPTION: Places a black 16x107 rectangle at position (168, 18).
; PLAN: r0=168(x), r1=18(y), r2=16(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 18
LDI r2, 16
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
