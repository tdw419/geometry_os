; DESCRIPTION: Creates a green rectangular region at (56, 27) spanning 118 by 16 pixels.
; PLAN: r0=56(x), r1=27(y), r2=118(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 27
LDI r2, 118
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
