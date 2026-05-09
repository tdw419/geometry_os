; DESCRIPTION: Places a magenta 42x64 rectangle at position (337, 67).
; PLAN: r0=337(x), r1=67(y), r2=42(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 67
LDI r2, 42
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
