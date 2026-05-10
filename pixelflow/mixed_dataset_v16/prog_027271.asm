; DESCRIPTION: Places a yellow 116x60 rectangle at position (100, 163).
; PLAN: r0=100(x), r1=163(y), r2=116(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 163
LDI r2, 116
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
