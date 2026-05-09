; DESCRIPTION: Places a magenta 118x63 rectangle at position (135, 139).
; PLAN: r0=135(x), r1=139(y), r2=118(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 139
LDI r2, 118
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
