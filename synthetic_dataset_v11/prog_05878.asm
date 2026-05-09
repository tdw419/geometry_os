; DESCRIPTION: Places a magenta 58x68 rectangle at position (74, 71).
; PLAN: r0=74(x), r1=71(y), r2=58(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 71
LDI r2, 58
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
