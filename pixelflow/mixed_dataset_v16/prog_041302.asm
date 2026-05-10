; DESCRIPTION: Creates a yellow rectangular region at (224, 20) spanning 27 by 92 pixels.
; PLAN: r0=224(x), r1=20(y), r2=27(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 20
LDI r2, 27
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
