; DESCRIPTION: Places a white 117x101 rectangle at position (100, 64).
; PLAN: r0=100(x), r1=64(y), r2=117(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 64
LDI r2, 117
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
