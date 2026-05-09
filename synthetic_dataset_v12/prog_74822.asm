; DESCRIPTION: Creates a green rectangular region at (196, 103) spanning 87 by 62 pixels.
; PLAN: r0=196(x), r1=103(y), r2=87(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 103
LDI r2, 87
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
