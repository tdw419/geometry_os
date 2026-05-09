; DESCRIPTION: Places a magenta 90x64 rectangle at position (335, 105).
; PLAN: r0=335(x), r1=105(y), r2=90(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 105
LDI r2, 90
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
