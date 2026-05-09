; DESCRIPTION: Places a blue 57x32 rectangle at position (122, 191).
; PLAN: r0=122(x), r1=191(y), r2=57(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 191
LDI r2, 57
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
