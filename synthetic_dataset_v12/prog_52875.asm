; DESCRIPTION: Creates a black rectangular region at (198, 7) spanning 67 by 111 pixels.
; PLAN: r0=198(x), r1=7(y), r2=67(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 7
LDI r2, 67
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
