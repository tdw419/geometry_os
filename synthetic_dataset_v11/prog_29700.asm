; DESCRIPTION: Creates a yellow rectangular region at (72, 78) spanning 113 by 30 pixels.
; PLAN: r0=72(x), r1=78(y), r2=113(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 78
LDI r2, 113
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
