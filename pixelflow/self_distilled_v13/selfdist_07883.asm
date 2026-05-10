; DESCRIPTION: Creates a orange filled rectangle of size 92x69 starting at (47, 131).
; PLAN: r0=47(x), r1=131(y), r2=92(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 131
LDI r2, 92
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
