; DESCRIPTION: Creates a white rectangular region at (114, 137) spanning 93 by 36 pixels.
; PLAN: r0=114(x), r1=137(y), r2=93(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 137
LDI r2, 93
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
