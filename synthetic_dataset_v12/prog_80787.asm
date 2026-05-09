; DESCRIPTION: Creates a red rectangular region at (145, 136) spanning 16 by 119 pixels.
; PLAN: r0=145(x), r1=136(y), r2=16(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 136
LDI r2, 16
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
