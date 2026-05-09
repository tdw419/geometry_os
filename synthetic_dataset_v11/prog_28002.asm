; DESCRIPTION: Creates a white rectangular region at (103, 28) spanning 28 by 12 pixels.
; PLAN: r0=103(x), r1=28(y), r2=28(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 28
LDI r2, 28
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
