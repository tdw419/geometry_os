; DESCRIPTION: Creates a black rectangular region at (284, 7) spanning 35 by 102 pixels.
; PLAN: r0=284(x), r1=7(y), r2=35(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 7
LDI r2, 35
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
