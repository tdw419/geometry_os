; DESCRIPTION: Places a magenta 89x55 rectangle at position (212, 163).
; PLAN: r0=212(x), r1=163(y), r2=89(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 163
LDI r2, 89
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
