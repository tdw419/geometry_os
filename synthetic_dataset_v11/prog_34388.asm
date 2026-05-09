; DESCRIPTION: Creates a blue rectangular region at (28, 21) spanning 91 by 56 pixels.
; PLAN: r0=28(x), r1=21(y), r2=91(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 21
LDI r2, 91
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
