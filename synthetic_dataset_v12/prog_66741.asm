; DESCRIPTION: Places a magenta 59x36 rectangle at position (91, 61).
; PLAN: r0=91(x), r1=61(y), r2=59(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 61
LDI r2, 59
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
