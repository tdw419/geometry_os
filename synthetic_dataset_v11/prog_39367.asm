; DESCRIPTION: Places a magenta 18x103 rectangle at position (100, 126).
; PLAN: r0=100(x), r1=126(y), r2=18(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 126
LDI r2, 18
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
