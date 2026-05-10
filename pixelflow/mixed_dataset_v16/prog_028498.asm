; DESCRIPTION: Creates a purple rectangular region at (235, 207) spanning 118 by 27 pixels.
; PLAN: r0=235(x), r1=207(y), r2=118(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 207
LDI r2, 118
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
