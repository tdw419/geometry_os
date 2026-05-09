; DESCRIPTION: Places a magenta 103x24 rectangle at position (10, 5).
; PLAN: r0=10(x), r1=5(y), r2=103(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 5
LDI r2, 103
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
