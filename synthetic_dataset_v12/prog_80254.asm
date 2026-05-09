; DESCRIPTION: Creates a green rectangular region at (7, 57) spanning 111 by 85 pixels.
; PLAN: r0=7(x), r1=57(y), r2=111(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 57
LDI r2, 111
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
