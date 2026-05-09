; DESCRIPTION: Creates a black rectangular region at (271, 134) spanning 89 by 103 pixels.
; PLAN: r0=271(x), r1=134(y), r2=89(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 134
LDI r2, 89
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
