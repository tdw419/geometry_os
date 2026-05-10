; DESCRIPTION: Creates a yellow rectangular region at (123, 163) spanning 103 by 14 pixels.
; PLAN: r0=123(x), r1=163(y), r2=103(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 163
LDI r2, 103
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
