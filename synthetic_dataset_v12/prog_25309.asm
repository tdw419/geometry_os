; DESCRIPTION: Creates a blue rectangular region at (235, 194) spanning 45 by 20 pixels.
; PLAN: r0=235(x), r1=194(y), r2=45(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 194
LDI r2, 45
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
