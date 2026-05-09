; DESCRIPTION: Creates a magenta rectangular region at (333, 70) spanning 16 by 99 pixels.
; PLAN: r0=333(x), r1=70(y), r2=16(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 70
LDI r2, 16
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
