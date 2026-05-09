; DESCRIPTION: Places a magenta 39x26 rectangle at position (107, 175).
; PLAN: r0=107(x), r1=175(y), r2=39(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 175
LDI r2, 39
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
