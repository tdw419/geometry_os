; DESCRIPTION: Creates a white rectangular region at (103, 146) spanning 88 by 84 pixels.
; PLAN: r0=103(x), r1=146(y), r2=88(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 146
LDI r2, 88
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
