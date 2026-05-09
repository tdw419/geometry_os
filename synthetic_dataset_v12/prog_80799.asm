; DESCRIPTION: Creates a blue rectangular region at (211, 128) spanning 27 by 91 pixels.
; PLAN: r0=211(x), r1=128(y), r2=27(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 128
LDI r2, 27
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
