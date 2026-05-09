; DESCRIPTION: Places a magenta 26x54 rectangle at position (169, 169).
; PLAN: r0=169(x), r1=169(y), r2=26(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 169
LDI r2, 26
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
