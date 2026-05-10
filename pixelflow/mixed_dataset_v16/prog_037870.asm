; DESCRIPTION: Creates a white rectangular region at (120, 184) spanning 65 by 18 pixels.
; PLAN: r0=120(x), r1=184(y), r2=65(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 184
LDI r2, 65
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
