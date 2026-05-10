; DESCRIPTION: Creates a yellow filled rectangle of size 69x69 starting at (367, 169).
; PLAN: r0=367(x), r1=169(y), r2=69(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 169
LDI r2, 69
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
