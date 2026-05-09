; DESCRIPTION: Places a magenta 105x59 rectangle at position (248, 29).
; PLAN: r0=248(x), r1=29(y), r2=105(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 29
LDI r2, 105
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
