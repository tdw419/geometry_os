; DESCRIPTION: Creates a orange rectangular region at (175, 111) spanning 34 by 100 pixels.
; PLAN: r0=175(x), r1=111(y), r2=34(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 111
LDI r2, 34
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
