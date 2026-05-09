; DESCRIPTION: Creates a black rectangular region at (284, 197) spanning 78 by 14 pixels.
; PLAN: r0=284(x), r1=197(y), r2=78(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 197
LDI r2, 78
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
