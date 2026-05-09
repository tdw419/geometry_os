; DESCRIPTION: Creates a white rectangular region at (425, 13) spanning 26 by 29 pixels.
; PLAN: r0=425(x), r1=13(y), r2=26(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 13
LDI r2, 26
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
