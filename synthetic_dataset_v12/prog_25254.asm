; DESCRIPTION: Creates a white rectangular region at (336, 165) spanning 109 by 54 pixels.
; PLAN: r0=336(x), r1=165(y), r2=109(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 165
LDI r2, 109
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
