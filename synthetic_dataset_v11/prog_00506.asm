; DESCRIPTION: Creates a green rectangular region at (171, 185) spanning 16 by 62 pixels.
; PLAN: r0=171(x), r1=185(y), r2=16(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 185
LDI r2, 16
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
