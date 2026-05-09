; DESCRIPTION: Places a magenta 11x117 rectangle at position (212, 4).
; PLAN: r0=212(x), r1=4(y), r2=11(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 4
LDI r2, 11
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
