; DESCRIPTION: Places a orange 92x94 rectangle at position (134, 128).
; PLAN: r0=134(x), r1=128(y), r2=92(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 128
LDI r2, 92
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
