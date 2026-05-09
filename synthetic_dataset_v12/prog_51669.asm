; DESCRIPTION: Creates a magenta rectangular region at (43, 168) spanning 91 by 46 pixels.
; PLAN: r0=43(x), r1=168(y), r2=91(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 168
LDI r2, 91
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
