; DESCRIPTION: Creates a green rectangular region at (372, 46) spanning 37 by 67 pixels.
; PLAN: r0=372(x), r1=46(y), r2=37(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 46
LDI r2, 37
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
