; DESCRIPTION: Places a magenta 98x22 rectangle at position (0, 199).
; PLAN: r0=0(x), r1=199(y), r2=98(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 199
LDI r2, 98
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
