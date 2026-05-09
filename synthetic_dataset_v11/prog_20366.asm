; DESCRIPTION: Creates a green rectangular region at (124, 90) spanning 120 by 69 pixels.
; PLAN: r0=124(x), r1=90(y), r2=120(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 90
LDI r2, 120
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
