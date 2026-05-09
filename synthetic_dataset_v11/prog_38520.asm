; DESCRIPTION: Places a magenta 18x75 rectangle at position (47, 76).
; PLAN: r0=47(x), r1=76(y), r2=18(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 76
LDI r2, 18
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
