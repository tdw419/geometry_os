; DESCRIPTION: Creates a white rectangular region at (247, 235) spanning 29 by 10 pixels.
; PLAN: r0=247(x), r1=235(y), r2=29(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 235
LDI r2, 29
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
