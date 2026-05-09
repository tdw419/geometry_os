; DESCRIPTION: Creates a white rectangular region at (21, 165) spanning 82 by 75 pixels.
; PLAN: r0=21(x), r1=165(y), r2=82(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 165
LDI r2, 82
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
