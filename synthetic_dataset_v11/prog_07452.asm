; DESCRIPTION: Places a magenta 54x33 rectangle at position (47, 172).
; PLAN: r0=47(x), r1=172(y), r2=54(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 172
LDI r2, 54
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
