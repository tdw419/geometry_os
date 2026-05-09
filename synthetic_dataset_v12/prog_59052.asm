; DESCRIPTION: Creates a green rectangular region at (72, 96) spanning 21 by 112 pixels.
; PLAN: r0=72(x), r1=96(y), r2=21(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 96
LDI r2, 21
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
