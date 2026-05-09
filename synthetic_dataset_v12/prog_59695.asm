; DESCRIPTION: Creates a magenta rectangular region at (17, 190) spanning 24 by 55 pixels.
; PLAN: r0=17(x), r1=190(y), r2=24(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 190
LDI r2, 24
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
