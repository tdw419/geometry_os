; DESCRIPTION: Creates a magenta rectangular region at (411, 184) spanning 40 by 70 pixels.
; PLAN: r0=411(x), r1=184(y), r2=40(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 184
LDI r2, 40
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
