; DESCRIPTION: Places a blue 86x108 rectangle at position (116, 36).
; PLAN: r0=116(x), r1=36(y), r2=86(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 36
LDI r2, 86
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
