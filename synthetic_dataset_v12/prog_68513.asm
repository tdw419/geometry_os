; DESCRIPTION: Creates a blue rectangular region at (415, 185) spanning 27 by 58 pixels.
; PLAN: r0=415(x), r1=185(y), r2=27(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 185
LDI r2, 27
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
