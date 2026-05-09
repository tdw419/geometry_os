; DESCRIPTION: Creates a yellow rectangular region at (120, 112) spanning 64 by 69 pixels.
; PLAN: r0=120(x), r1=112(y), r2=64(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 112
LDI r2, 64
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
