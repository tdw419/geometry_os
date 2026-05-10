; DESCRIPTION: Creates a white rectangular region at (337, 5) spanning 60 by 74 pixels.
; PLAN: r0=337(x), r1=5(y), r2=60(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 5
LDI r2, 60
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
