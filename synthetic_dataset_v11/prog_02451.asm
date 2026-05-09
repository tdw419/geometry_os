; DESCRIPTION: Creates a magenta rectangular region at (206, 45) spanning 35 by 106 pixels.
; PLAN: r0=206(x), r1=45(y), r2=35(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 45
LDI r2, 35
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
