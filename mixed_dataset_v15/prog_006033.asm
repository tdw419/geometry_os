; DESCRIPTION: Creates a white rectangular region at (30, 156) spanning 50 by 24 pixels.
; PLAN: r0=30(x), r1=156(y), r2=50(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 156
LDI r2, 50
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
