; DESCRIPTION: Places a magenta 62x25 rectangle at position (425, 61).
; PLAN: r0=425(x), r1=61(y), r2=62(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 61
LDI r2, 62
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
