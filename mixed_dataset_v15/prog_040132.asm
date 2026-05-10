; DESCRIPTION: Creates a magenta rectangular region at (160, 53) spanning 21 by 91 pixels.
; PLAN: r0=160(x), r1=53(y), r2=21(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 53
LDI r2, 21
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
