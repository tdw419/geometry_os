; DESCRIPTION: Places a magenta 102x81 rectangle at position (30, 28).
; PLAN: r0=30(x), r1=28(y), r2=102(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 28
LDI r2, 102
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
