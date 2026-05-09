; DESCRIPTION: Creates a magenta rectangular region at (372, 34) spanning 35 by 120 pixels.
; PLAN: r0=372(x), r1=34(y), r2=35(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 34
LDI r2, 35
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
