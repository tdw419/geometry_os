; DESCRIPTION: Creates a yellow rectangular region at (24, 80) spanning 103 by 24 pixels.
; PLAN: r0=24(x), r1=80(y), r2=103(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 80
LDI r2, 103
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
