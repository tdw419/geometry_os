; DESCRIPTION: Creates a green rectangular region at (387, 76) spanning 10 by 67 pixels.
; PLAN: r0=387(x), r1=76(y), r2=10(width), r3=67(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 76
LDI r2, 10
LDI r3, 67
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
