; DESCRIPTION: Creates a blue rectangular region at (270, 160) spanning 60 by 91 pixels.
; PLAN: r0=270(x), r1=160(y), r2=60(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 160
LDI r2, 60
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
