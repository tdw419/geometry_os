; DESCRIPTION: Places a black 16x61 rectangle at position (29, 18).
; PLAN: r0=29(x), r1=18(y), r2=16(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 18
LDI r2, 16
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
