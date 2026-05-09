; DESCRIPTION: Creates a green rectangular region at (387, 72) spanning 43 by 103 pixels.
; PLAN: r0=387(x), r1=72(y), r2=43(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 72
LDI r2, 43
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
