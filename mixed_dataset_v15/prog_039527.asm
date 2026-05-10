; DESCRIPTION: Creates a white rectangular region at (247, 92) spanning 55 by 103 pixels.
; PLAN: r0=247(x), r1=92(y), r2=55(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 92
LDI r2, 55
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
