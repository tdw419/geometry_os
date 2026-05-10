; DESCRIPTION: Creates a black rectangular region at (48, 68) spanning 36 by 48 pixels.
; PLAN: r0=48(x), r1=68(y), r2=36(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 68
LDI r2, 36
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
