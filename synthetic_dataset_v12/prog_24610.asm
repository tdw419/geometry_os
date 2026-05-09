; DESCRIPTION: Places a magenta 23x85 rectangle at position (363, 168).
; PLAN: r0=363(x), r1=168(y), r2=23(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 168
LDI r2, 23
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
