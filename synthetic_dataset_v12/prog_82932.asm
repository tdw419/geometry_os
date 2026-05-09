; DESCRIPTION: Places a magenta 38x59 rectangle at position (234, 166).
; PLAN: r0=234(x), r1=166(y), r2=38(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 166
LDI r2, 38
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
