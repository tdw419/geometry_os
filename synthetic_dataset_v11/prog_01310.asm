; DESCRIPTION: Places a yellow 96x61 rectangle at position (133, 30).
; PLAN: r0=133(x), r1=30(y), r2=96(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 30
LDI r2, 96
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
