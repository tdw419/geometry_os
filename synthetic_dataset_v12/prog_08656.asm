; DESCRIPTION: Places a magenta 55x36 rectangle at position (170, 78).
; PLAN: r0=170(x), r1=78(y), r2=55(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 78
LDI r2, 55
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
