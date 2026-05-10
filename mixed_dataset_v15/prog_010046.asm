; DESCRIPTION: Creates a white rectangular region at (286, 137) spanning 57 by 98 pixels.
; PLAN: r0=286(x), r1=137(y), r2=57(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 137
LDI r2, 57
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
