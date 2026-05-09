; DESCRIPTION: Places a blue 88x88 rectangle at position (410, 163).
; PLAN: r0=410(x), r1=163(y), r2=88(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 163
LDI r2, 88
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
