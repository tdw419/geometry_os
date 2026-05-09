; DESCRIPTION: Creates a green rectangular region at (218, 56) spanning 27 by 86 pixels.
; PLAN: r0=218(x), r1=56(y), r2=27(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 56
LDI r2, 27
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
