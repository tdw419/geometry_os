; DESCRIPTION: Places a magenta 59x65 rectangle at position (153, 137).
; PLAN: r0=153(x), r1=137(y), r2=59(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 137
LDI r2, 59
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
