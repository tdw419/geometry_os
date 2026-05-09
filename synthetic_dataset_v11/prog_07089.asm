; DESCRIPTION: Places a magenta 105x113 rectangle at position (81, 70).
; PLAN: r0=81(x), r1=70(y), r2=105(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 70
LDI r2, 105
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
