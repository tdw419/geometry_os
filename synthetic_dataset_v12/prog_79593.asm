; DESCRIPTION: Creates a blue rectangular region at (353, 13) spanning 91 by 107 pixels.
; PLAN: r0=353(x), r1=13(y), r2=91(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 13
LDI r2, 91
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
