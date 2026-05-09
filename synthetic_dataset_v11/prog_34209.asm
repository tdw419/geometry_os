; DESCRIPTION: Places a green 73x13 rectangle at position (50, 116).
; PLAN: r0=50(x), r1=116(y), r2=73(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 116
LDI r2, 73
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
