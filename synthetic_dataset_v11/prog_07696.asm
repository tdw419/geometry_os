; DESCRIPTION: Creates a white rectangular region at (150, 184) spanning 90 by 61 pixels.
; PLAN: r0=150(x), r1=184(y), r2=90(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 184
LDI r2, 90
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
