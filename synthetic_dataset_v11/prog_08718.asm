; DESCRIPTION: Creates a magenta rectangular region at (165, 165) spanning 80 by 55 pixels.
; PLAN: r0=165(x), r1=165(y), r2=80(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 165
LDI r2, 80
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
