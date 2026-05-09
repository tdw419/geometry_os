; DESCRIPTION: Creates a magenta rectangular region at (149, 87) spanning 103 by 83 pixels.
; PLAN: r0=149(x), r1=87(y), r2=103(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 87
LDI r2, 103
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
