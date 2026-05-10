; DESCRIPTION: Places a magenta 118x34 rectangle at position (39, 183).
; PLAN: r0=39(x), r1=183(y), r2=118(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 183
LDI r2, 118
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
