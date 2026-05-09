; DESCRIPTION: Creates a green rectangular region at (102, 64) spanning 90 by 86 pixels.
; PLAN: r0=102(x), r1=64(y), r2=90(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 64
LDI r2, 90
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
