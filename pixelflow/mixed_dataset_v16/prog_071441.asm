; DESCRIPTION: Places a magenta 78x76 box at position (20, 69).
; PLAN: r0=20(x), r1=69(y), r2=78(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 69
LDI r2, 78
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
