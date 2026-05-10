; DESCRIPTION: Creates a purple rectangular region at (486, 235) spanning 15 by 12 pixels.
; PLAN: r0=486(x), r1=235(y), r2=15(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 235
LDI r2, 15
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
