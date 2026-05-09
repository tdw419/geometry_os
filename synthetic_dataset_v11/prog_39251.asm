; DESCRIPTION: Places a magenta 86x45 rectangle at position (60, 81).
; PLAN: r0=60(x), r1=81(y), r2=86(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 81
LDI r2, 86
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
