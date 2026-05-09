; DESCRIPTION: Creates a purple rectangular region at (235, 188) spanning 84 by 48 pixels.
; PLAN: r0=235(x), r1=188(y), r2=84(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 188
LDI r2, 84
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
