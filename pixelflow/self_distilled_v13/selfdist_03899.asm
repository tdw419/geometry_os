; DESCRIPTION: Creates a magenta filled rectangle of size 55x69 starting at (369, 156).
; PLAN: r0=369(x), r1=156(y), r2=55(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 156
LDI r2, 55
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
