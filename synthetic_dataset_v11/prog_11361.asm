; DESCRIPTION: Creates a magenta rectangular region at (70, 89) spanning 10 by 91 pixels.
; PLAN: r0=70(x), r1=89(y), r2=10(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 89
LDI r2, 10
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
