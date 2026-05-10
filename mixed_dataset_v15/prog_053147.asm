; DESCRIPTION: Creates a white rectangular region at (282, 146) spanning 44 by 71 pixels.
; PLAN: r0=282(x), r1=146(y), r2=44(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 146
LDI r2, 44
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
