; DESCRIPTION: Creates a white rectangular region at (54, 137) spanning 37 by 18 pixels.
; PLAN: r0=54(x), r1=137(y), r2=37(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 137
LDI r2, 37
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
