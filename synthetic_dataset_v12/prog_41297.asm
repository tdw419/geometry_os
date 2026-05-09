; DESCRIPTION: Places a black 61x39 rectangle at position (102, 115).
; PLAN: r0=102(x), r1=115(y), r2=61(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 115
LDI r2, 61
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
