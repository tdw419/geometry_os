; DESCRIPTION: Creates a blue rectangular region at (144, 183) spanning 91 by 27 pixels.
; PLAN: r0=144(x), r1=183(y), r2=91(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 183
LDI r2, 91
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
