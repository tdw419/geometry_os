; DESCRIPTION: Creates a yellow rectangular region at (189, 174) spanning 16 by 14 pixels.
; PLAN: r0=189(x), r1=174(y), r2=16(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 174
LDI r2, 16
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
