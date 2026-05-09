; DESCRIPTION: Places a blue 97x27 rectangle at position (156, 61).
; PLAN: r0=156(x), r1=61(y), r2=97(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 61
LDI r2, 97
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
