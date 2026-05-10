; DESCRIPTION: Creates a green rectangular region at (26, 5) spanning 111 by 85 pixels.
; PLAN: r0=26(x), r1=5(y), r2=111(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 5
LDI r2, 111
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
