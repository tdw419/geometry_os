; DESCRIPTION: Creates a black rectangular region at (206, 67) spanning 97 by 50 pixels.
; PLAN: r0=206(x), r1=67(y), r2=97(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 67
LDI r2, 97
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
