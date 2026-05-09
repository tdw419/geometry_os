; DESCRIPTION: Places a green 25x108 rectangle at position (72, 61).
; PLAN: r0=72(x), r1=61(y), r2=25(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 61
LDI r2, 25
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
