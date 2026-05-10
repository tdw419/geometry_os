; DESCRIPTION: Creates a green rectangular region at (135, 133) spanning 72 by 39 pixels.
; PLAN: r0=135(x), r1=133(y), r2=72(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 133
LDI r2, 72
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
