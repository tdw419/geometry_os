; DESCRIPTION: Creates a green rectangular region at (57, 30) spanning 111 by 59 pixels.
; PLAN: r0=57(x), r1=30(y), r2=111(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 30
LDI r2, 111
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
