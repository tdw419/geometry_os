; DESCRIPTION: Creates a green rectangular region at (168, 14) spanning 69 by 81 pixels.
; PLAN: r0=168(x), r1=14(y), r2=69(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 14
LDI r2, 69
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
