; DESCRIPTION: Places a magenta 119x42 rectangle at position (233, 103).
; PLAN: r0=233(x), r1=103(y), r2=119(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 103
LDI r2, 119
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
