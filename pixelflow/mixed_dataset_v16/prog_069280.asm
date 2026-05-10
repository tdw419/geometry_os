; DESCRIPTION: Creates a yellow rectangular region at (315, 57) spanning 13 by 103 pixels.
; PLAN: r0=315(x), r1=57(y), r2=13(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 57
LDI r2, 13
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
