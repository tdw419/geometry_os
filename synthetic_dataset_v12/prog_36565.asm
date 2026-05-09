; DESCRIPTION: Places a black 92x57 rectangle at position (371, 36).
; PLAN: r0=371(x), r1=36(y), r2=92(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 36
LDI r2, 92
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
