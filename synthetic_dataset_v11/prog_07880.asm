; DESCRIPTION: Places a magenta 19x68 rectangle at position (195, 42).
; PLAN: r0=195(x), r1=42(y), r2=19(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 42
LDI r2, 19
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
