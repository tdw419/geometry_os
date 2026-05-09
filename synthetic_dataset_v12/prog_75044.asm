; DESCRIPTION: Creates a white rectangular region at (453, 108) spanning 11 by 27 pixels.
; PLAN: r0=453(x), r1=108(y), r2=11(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 108
LDI r2, 11
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
