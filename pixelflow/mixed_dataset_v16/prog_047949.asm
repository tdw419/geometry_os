; DESCRIPTION: Creates a white rectangular region at (153, 0) spanning 103 by 18 pixels.
; PLAN: r0=153(x), r1=0(y), r2=103(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 0
LDI r2, 103
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
