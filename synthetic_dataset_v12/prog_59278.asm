; DESCRIPTION: Places a magenta 30x26 rectangle at position (463, 125).
; PLAN: r0=463(x), r1=125(y), r2=30(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 125
LDI r2, 30
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
