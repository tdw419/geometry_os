; DESCRIPTION: Creates a magenta rectangular region at (46, 95) spanning 32 by 69 pixels.
; PLAN: r0=46(x), r1=95(y), r2=32(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 95
LDI r2, 32
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
