; DESCRIPTION: Creates a magenta rectangular region at (150, 185) spanning 12 by 69 pixels.
; PLAN: r0=150(x), r1=185(y), r2=12(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 185
LDI r2, 12
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
