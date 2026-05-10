; DESCRIPTION: Places a magenta 97x17 rectangle at position (117, 183).
; PLAN: r0=117(x), r1=183(y), r2=97(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 183
LDI r2, 97
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
