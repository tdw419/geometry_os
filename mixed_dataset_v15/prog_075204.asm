; DESCRIPTION: Creates a white rectangular region at (384, 66) spanning 100 by 92 pixels.
; PLAN: r0=384(x), r1=66(y), r2=100(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 66
LDI r2, 100
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
