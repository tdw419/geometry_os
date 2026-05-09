; DESCRIPTION: Creates a black rectangular region at (135, 168) spanning 97 by 67 pixels.
; PLAN: r0=135(x), r1=168(y), r2=97(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 168
LDI r2, 97
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
