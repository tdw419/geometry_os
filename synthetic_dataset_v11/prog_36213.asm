; DESCRIPTION: Creates a magenta rectangular region at (87, 27) spanning 54 by 26 pixels.
; PLAN: r0=87(x), r1=27(y), r2=54(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 27
LDI r2, 54
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
