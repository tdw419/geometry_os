; DESCRIPTION: Places a red 64x61 rectangle at position (151, 99).
; PLAN: r0=151(x), r1=99(y), r2=64(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 99
LDI r2, 64
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
