; DESCRIPTION: Creates a magenta filled rectangle of size 104x33 starting at (26, 18).
; PLAN: r0=26(x), r1=18(y), r2=104(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 18
LDI r2, 104
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
