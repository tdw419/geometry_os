; DESCRIPTION: Creates a yellow rectangular region at (393, 224) spanning 63 by 18 pixels.
; PLAN: r0=393(x), r1=224(y), r2=63(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 224
LDI r2, 63
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
