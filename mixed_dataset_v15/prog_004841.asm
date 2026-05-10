; DESCRIPTION: Places a magenta 101x106 rectangle at position (135, 130).
; PLAN: r0=135(x), r1=130(y), r2=101(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 130
LDI r2, 101
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
