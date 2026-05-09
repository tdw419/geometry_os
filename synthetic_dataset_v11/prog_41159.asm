; DESCRIPTION: Creates a green rectangular region at (80, 109) spanning 111 by 54 pixels.
; PLAN: r0=80(x), r1=109(y), r2=111(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 109
LDI r2, 111
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
