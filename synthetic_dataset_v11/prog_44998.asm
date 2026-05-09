; DESCRIPTION: Creates a green rectangular region at (159, 61) spanning 72 by 111 pixels.
; PLAN: r0=159(x), r1=61(y), r2=72(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 61
LDI r2, 72
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
