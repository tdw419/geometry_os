; DESCRIPTION: Places a magenta 18x29 rectangle at position (25, 126).
; PLAN: r0=25(x), r1=126(y), r2=18(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 126
LDI r2, 18
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
