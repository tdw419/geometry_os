; DESCRIPTION: Places a black 61x71 rectangle at position (72, 31).
; PLAN: r0=72(x), r1=31(y), r2=61(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 31
LDI r2, 61
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
