; DESCRIPTION: Places a black 92x45 rectangle at position (114, 113).
; PLAN: r0=114(x), r1=113(y), r2=92(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 113
LDI r2, 92
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
