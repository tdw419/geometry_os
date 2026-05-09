; DESCRIPTION: Creates a magenta rectangular region at (87, 68) spanning 37 by 25 pixels.
; PLAN: r0=87(x), r1=68(y), r2=37(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 68
LDI r2, 37
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
