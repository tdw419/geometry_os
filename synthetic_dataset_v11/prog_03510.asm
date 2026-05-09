; DESCRIPTION: Places a magenta 82x81 rectangle at position (69, 61).
; PLAN: r0=69(x), r1=61(y), r2=82(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 61
LDI r2, 82
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
