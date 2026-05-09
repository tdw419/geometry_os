; DESCRIPTION: Creates a magenta rectangular region at (345, 44) spanning 33 by 76 pixels.
; PLAN: r0=345(x), r1=44(y), r2=33(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 44
LDI r2, 33
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
