; DESCRIPTION: Creates a black rectangular region at (50, 28) spanning 75 by 67 pixels.
; PLAN: r0=50(x), r1=28(y), r2=75(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 28
LDI r2, 75
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
