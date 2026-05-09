; DESCRIPTION: Places a magenta 118x66 rectangle at position (39, 170).
; PLAN: r0=39(x), r1=170(y), r2=118(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 170
LDI r2, 118
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
