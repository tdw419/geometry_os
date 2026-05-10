; DESCRIPTION: Creates a green rectangular region at (125, 31) spanning 111 by 44 pixels.
; PLAN: r0=125(x), r1=31(y), r2=111(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 31
LDI r2, 111
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
