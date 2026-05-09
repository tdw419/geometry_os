; DESCRIPTION: Creates a yellow rectangular region at (27, 84) spanning 116 by 103 pixels.
; PLAN: r0=27(x), r1=84(y), r2=116(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 84
LDI r2, 116
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
