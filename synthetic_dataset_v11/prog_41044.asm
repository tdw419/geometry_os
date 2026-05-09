; DESCRIPTION: Creates a white rectangular region at (125, 120) spanning 28 by 115 pixels.
; PLAN: r0=125(x), r1=120(y), r2=28(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 120
LDI r2, 28
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
