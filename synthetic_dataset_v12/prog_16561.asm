; DESCRIPTION: Places a magenta 42x27 rectangle at position (240, 74).
; PLAN: r0=240(x), r1=74(y), r2=42(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 74
LDI r2, 42
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
