; DESCRIPTION: Creates a black rectangular region at (5, 168) spanning 37 by 68 pixels.
; PLAN: r0=5(x), r1=168(y), r2=37(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 168
LDI r2, 37
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
