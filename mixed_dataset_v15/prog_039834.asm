; DESCRIPTION: Places a magenta 34x69 rectangle at position (189, 4).
; PLAN: r0=189(x), r1=4(y), r2=34(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 4
LDI r2, 34
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
