; DESCRIPTION: Places a magenta 119x25 rectangle at position (228, 42).
; PLAN: r0=228(x), r1=42(y), r2=119(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 42
LDI r2, 119
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
