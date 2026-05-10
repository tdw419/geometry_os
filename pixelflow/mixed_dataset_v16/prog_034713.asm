; DESCRIPTION: Creates a white rectangular region at (281, 137) spanning 75 by 47 pixels.
; PLAN: r0=281(x), r1=137(y), r2=75(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 137
LDI r2, 75
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
