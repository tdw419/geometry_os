; DESCRIPTION: Places a magenta 99x92 rectangle at position (94, 42).
; PLAN: r0=94(x), r1=42(y), r2=99(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 42
LDI r2, 99
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
