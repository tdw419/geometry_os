; DESCRIPTION: Places a blue 69x14 rectangle at position (410, 81).
; PLAN: r0=410(x), r1=81(y), r2=69(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 81
LDI r2, 69
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
