; DESCRIPTION: Places a magenta 70x102 rectangle at position (436, 42).
; PLAN: r0=436(x), r1=42(y), r2=70(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 42
LDI r2, 70
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
