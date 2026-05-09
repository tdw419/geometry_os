; DESCRIPTION: Places a magenta 21x108 rectangle at position (98, 3).
; PLAN: r0=98(x), r1=3(y), r2=21(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 3
LDI r2, 21
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
