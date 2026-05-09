; DESCRIPTION: Places a yellow 25x56 rectangle at position (178, 116).
; PLAN: r0=178(x), r1=116(y), r2=25(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 116
LDI r2, 25
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
