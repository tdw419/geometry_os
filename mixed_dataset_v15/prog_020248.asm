; DESCRIPTION: Places a magenta 38x23 box at position (94, 32).
; PLAN: r0=94(x), r1=32(y), r2=38(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 32
LDI r2, 38
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
