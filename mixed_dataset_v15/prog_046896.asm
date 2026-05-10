; DESCRIPTION: Places a blue 22x22 rectangle at position (265, 62).
; PLAN: r0=265(x), r1=62(y), r2=22(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 62
LDI r2, 22
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
