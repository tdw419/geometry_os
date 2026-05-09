; DESCRIPTION: Places a magenta 72x120 rectangle at position (94, 31).
; PLAN: r0=94(x), r1=31(y), r2=72(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 31
LDI r2, 72
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
