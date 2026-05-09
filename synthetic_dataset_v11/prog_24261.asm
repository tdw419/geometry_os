; DESCRIPTION: Creates a black rectangular region at (50, 22) spanning 82 by 68 pixels.
; PLAN: r0=50(x), r1=22(y), r2=82(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 22
LDI r2, 82
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
