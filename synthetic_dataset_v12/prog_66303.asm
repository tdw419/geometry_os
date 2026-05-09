; DESCRIPTION: Places a blue 113x83 rectangle at position (376, 68).
; PLAN: r0=376(x), r1=68(y), r2=113(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 68
LDI r2, 113
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
