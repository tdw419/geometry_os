; DESCRIPTION: Places a purple 61x78 rectangle at position (2, 95).
; PLAN: r0=2(x), r1=95(y), r2=61(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 95
LDI r2, 61
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
