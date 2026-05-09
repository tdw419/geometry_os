; DESCRIPTION: Creates a magenta rectangular region at (208, 22) spanning 28 by 91 pixels.
; PLAN: r0=208(x), r1=22(y), r2=28(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 22
LDI r2, 28
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
