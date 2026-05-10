; DESCRIPTION: Places a magenta 54x68 rectangle at position (190, 183).
; PLAN: r0=190(x), r1=183(y), r2=54(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 183
LDI r2, 54
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
