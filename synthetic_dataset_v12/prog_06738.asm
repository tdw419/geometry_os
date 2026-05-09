; DESCRIPTION: Creates a magenta rectangular region at (395, 189) spanning 98 by 54 pixels.
; PLAN: r0=395(x), r1=189(y), r2=98(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 189
LDI r2, 98
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
