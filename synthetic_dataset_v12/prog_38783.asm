; DESCRIPTION: Places a magenta 26x25 rectangle at position (153, 196).
; PLAN: r0=153(x), r1=196(y), r2=26(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 196
LDI r2, 26
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
