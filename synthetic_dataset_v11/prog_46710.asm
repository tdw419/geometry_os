; DESCRIPTION: Places a blue 99x26 rectangle at position (111, 115).
; PLAN: r0=111(x), r1=115(y), r2=99(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 115
LDI r2, 99
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
