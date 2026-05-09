; DESCRIPTION: Creates a black rectangular region at (103, 171) spanning 100 by 68 pixels.
; PLAN: r0=103(x), r1=171(y), r2=100(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 171
LDI r2, 100
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
