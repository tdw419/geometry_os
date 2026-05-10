; DESCRIPTION: Creates a yellow rectangular region at (40, 10) spanning 103 by 82 pixels.
; PLAN: r0=40(x), r1=10(y), r2=103(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 10
LDI r2, 103
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
