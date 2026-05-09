; DESCRIPTION: Creates a magenta rectangular region at (229, 175) spanning 98 by 68 pixels.
; PLAN: r0=229(x), r1=175(y), r2=98(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 175
LDI r2, 98
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
