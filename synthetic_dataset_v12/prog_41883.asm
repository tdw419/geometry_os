; DESCRIPTION: Places a yellow 61x117 rectangle at position (22, 116).
; PLAN: r0=22(x), r1=116(y), r2=61(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 116
LDI r2, 61
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
