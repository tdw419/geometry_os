; DESCRIPTION: Creates a white rectangular region at (235, 182) spanning 21 by 62 pixels.
; PLAN: r0=235(x), r1=182(y), r2=21(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 182
LDI r2, 21
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
