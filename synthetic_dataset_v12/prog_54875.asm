; DESCRIPTION: Creates a yellow rectangular region at (98, 152) spanning 27 by 56 pixels.
; PLAN: r0=98(x), r1=152(y), r2=27(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 152
LDI r2, 27
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
