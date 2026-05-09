; DESCRIPTION: Renders a magenta box of size 68x69 starting at (344, 139).
; PLAN: r0=344(x), r1=139(y), r2=68(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 139
LDI r2, 68
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
