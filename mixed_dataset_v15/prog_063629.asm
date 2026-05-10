; DESCRIPTION: Places a magenta 69x42 rectangle at position (337, 150).
; PLAN: r0=337(x), r1=150(y), r2=69(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 150
LDI r2, 69
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
