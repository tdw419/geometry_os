; DESCRIPTION: Creates a white rectangular region at (394, 12) spanning 21 by 30 pixels.
; PLAN: r0=394(x), r1=12(y), r2=21(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 12
LDI r2, 21
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
