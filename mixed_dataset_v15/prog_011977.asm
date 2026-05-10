; DESCRIPTION: Creates a blue rectangular region at (384, 40) spanning 80 by 103 pixels.
; PLAN: r0=384(x), r1=40(y), r2=80(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 40
LDI r2, 80
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
