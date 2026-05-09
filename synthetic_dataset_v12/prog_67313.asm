; DESCRIPTION: Places a blue 58x113 rectangle at position (418, 74).
; PLAN: r0=418(x), r1=74(y), r2=58(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 74
LDI r2, 58
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
