; DESCRIPTION: Creates a magenta rectangular region at (295, 43) spanning 38 by 34 pixels.
; PLAN: r0=295(x), r1=43(y), r2=38(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 43
LDI r2, 38
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
