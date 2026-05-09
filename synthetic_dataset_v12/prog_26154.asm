; DESCRIPTION: Creates a magenta rectangular region at (87, 15) spanning 83 by 61 pixels.
; PLAN: r0=87(x), r1=15(y), r2=83(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 15
LDI r2, 83
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
