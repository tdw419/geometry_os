; DESCRIPTION: Places a magenta 63x59 rectangle at position (45, 194).
; PLAN: r0=45(x), r1=194(y), r2=63(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 194
LDI r2, 63
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
