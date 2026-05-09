; DESCRIPTION: Creates a blue rectangular region at (414, 25) spanning 52 by 91 pixels.
; PLAN: r0=414(x), r1=25(y), r2=52(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 25
LDI r2, 52
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
