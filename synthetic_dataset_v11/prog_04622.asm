; DESCRIPTION: Creates a magenta rectangular region at (87, 16) spanning 17 by 76 pixels.
; PLAN: r0=87(x), r1=16(y), r2=17(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 16
LDI r2, 17
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
