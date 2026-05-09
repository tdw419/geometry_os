; DESCRIPTION: Creates a green rectangular region at (94, 59) spanning 111 by 30 pixels.
; PLAN: r0=94(x), r1=59(y), r2=111(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 59
LDI r2, 111
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
