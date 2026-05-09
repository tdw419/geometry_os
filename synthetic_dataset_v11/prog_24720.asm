; DESCRIPTION: Places a red 58x92 rectangle at position (128, 74).
; PLAN: r0=128(x), r1=74(y), r2=58(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 74
LDI r2, 58
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
