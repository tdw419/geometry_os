; DESCRIPTION: Creates a green rectangular region at (412, 87) spanning 17 by 50 pixels.
; PLAN: r0=412(x), r1=87(y), r2=17(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 87
LDI r2, 17
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
