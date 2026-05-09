; DESCRIPTION: Places a magenta 46x106 rectangle at position (205, 0).
; PLAN: r0=205(x), r1=0(y), r2=46(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 0
LDI r2, 46
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
