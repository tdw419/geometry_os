; DESCRIPTION: Creates a blue rectangular region at (386, 84) spanning 103 by 101 pixels.
; PLAN: r0=386(x), r1=84(y), r2=103(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 84
LDI r2, 103
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
