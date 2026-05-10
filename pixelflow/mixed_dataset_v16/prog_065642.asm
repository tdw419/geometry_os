; DESCRIPTION: Creates a magenta rectangular region at (302, 102) spanning 86 by 42 pixels.
; PLAN: r0=302(x), r1=102(y), r2=86(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 102
LDI r2, 86
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
