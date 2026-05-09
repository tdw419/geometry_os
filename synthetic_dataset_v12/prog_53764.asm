; DESCRIPTION: Creates a white rectangular region at (89, 24) spanning 50 by 95 pixels.
; PLAN: r0=89(x), r1=24(y), r2=50(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 24
LDI r2, 50
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
