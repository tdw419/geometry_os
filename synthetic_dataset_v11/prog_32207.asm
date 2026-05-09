; DESCRIPTION: Places a magenta 30x76 rectangle at position (168, 75).
; PLAN: r0=168(x), r1=75(y), r2=30(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 75
LDI r2, 30
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
