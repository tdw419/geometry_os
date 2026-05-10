; DESCRIPTION: Creates a magenta rectangular region at (55, 74) spanning 50 by 66 pixels.
; PLAN: r0=55(x), r1=74(y), r2=50(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 74
LDI r2, 50
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
