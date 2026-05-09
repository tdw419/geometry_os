; DESCRIPTION: Places a magenta 80x14 rectangle at position (156, 94).
; PLAN: r0=156(x), r1=94(y), r2=80(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 94
LDI r2, 80
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
