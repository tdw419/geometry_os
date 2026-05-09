; DESCRIPTION: Places a blue 26x65 rectangle at position (59, 109).
; PLAN: r0=59(x), r1=109(y), r2=26(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 109
LDI r2, 26
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
