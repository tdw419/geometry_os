; DESCRIPTION: Creates a green rectangular region at (86, 28) spanning 111 by 24 pixels.
; PLAN: r0=86(x), r1=28(y), r2=111(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 28
LDI r2, 111
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
