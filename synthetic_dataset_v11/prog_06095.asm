; DESCRIPTION: Places a magenta 45x42 rectangle at position (108, 185).
; PLAN: r0=108(x), r1=185(y), r2=45(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 185
LDI r2, 45
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
