; DESCRIPTION: Places a black 61x22 rectangle at position (78, 17).
; PLAN: r0=78(x), r1=17(y), r2=61(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 17
LDI r2, 61
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
