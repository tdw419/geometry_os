; DESCRIPTION: Places a orange 115x36 rectangle at position (21, 116).
; PLAN: r0=21(x), r1=116(y), r2=115(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 116
LDI r2, 115
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
