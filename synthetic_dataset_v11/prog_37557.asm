; DESCRIPTION: Creates a magenta rectangular region at (153, 5) spanning 68 by 10 pixels.
; PLAN: r0=153(x), r1=5(y), r2=68(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 5
LDI r2, 68
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
