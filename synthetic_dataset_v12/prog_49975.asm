; DESCRIPTION: Creates a magenta rectangular region at (333, 161) spanning 75 by 89 pixels.
; PLAN: r0=333(x), r1=161(y), r2=75(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 161
LDI r2, 75
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
