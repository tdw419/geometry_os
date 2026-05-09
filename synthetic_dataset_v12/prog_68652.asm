; DESCRIPTION: Creates a white rectangular region at (208, 29) spanning 40 by 13 pixels.
; PLAN: r0=208(x), r1=29(y), r2=40(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 29
LDI r2, 40
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
