; DESCRIPTION: Places a magenta 74x45 rectangle at position (144, 66).
; PLAN: r0=144(x), r1=66(y), r2=74(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 66
LDI r2, 74
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
