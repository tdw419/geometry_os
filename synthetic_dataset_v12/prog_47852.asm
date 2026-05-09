; DESCRIPTION: Places a blue 59x14 rectangle at position (184, 231).
; PLAN: r0=184(x), r1=231(y), r2=59(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 231
LDI r2, 59
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
