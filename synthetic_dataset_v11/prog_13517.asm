; DESCRIPTION: Places a blue 53x23 rectangle at position (191, 150).
; PLAN: r0=191(x), r1=150(y), r2=53(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 150
LDI r2, 53
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
