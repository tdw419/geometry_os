; DESCRIPTION: Places a magenta 43x105 rectangle at position (425, 148).
; PLAN: r0=425(x), r1=148(y), r2=43(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 148
LDI r2, 43
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
