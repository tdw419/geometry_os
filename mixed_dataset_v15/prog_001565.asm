; DESCRIPTION: Creates a magenta rectangular region at (337, 146) spanning 88 by 91 pixels.
; PLAN: r0=337(x), r1=146(y), r2=88(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 146
LDI r2, 88
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
