; DESCRIPTION: Places a magenta 78x108 rectangle at position (111, 32).
; PLAN: r0=111(x), r1=32(y), r2=78(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 32
LDI r2, 78
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
