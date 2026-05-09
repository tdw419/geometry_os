; DESCRIPTION: Places a magenta 54x10 rectangle at position (375, 10).
; PLAN: r0=375(x), r1=10(y), r2=54(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 10
LDI r2, 54
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
