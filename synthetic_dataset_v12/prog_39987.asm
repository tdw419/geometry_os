; DESCRIPTION: Places a black 61x49 rectangle at position (113, 5).
; PLAN: r0=113(x), r1=5(y), r2=61(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 5
LDI r2, 61
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
