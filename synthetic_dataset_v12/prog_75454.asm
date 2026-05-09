; DESCRIPTION: Creates a green rectangular region at (261, 133) spanning 113 by 56 pixels.
; PLAN: r0=261(x), r1=133(y), r2=113(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 133
LDI r2, 113
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
