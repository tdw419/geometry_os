; DESCRIPTION: Places a blue 12x78 rectangle at position (482, 30).
; PLAN: r0=482(x), r1=30(y), r2=12(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 30
LDI r2, 12
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
