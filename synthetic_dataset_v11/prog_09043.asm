; DESCRIPTION: Places a magenta 13x93 rectangle at position (154, 40).
; PLAN: r0=154(x), r1=40(y), r2=13(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 40
LDI r2, 13
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
