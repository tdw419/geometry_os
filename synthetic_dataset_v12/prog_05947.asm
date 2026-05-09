; DESCRIPTION: Creates a black rectangular region at (154, 21) spanning 36 by 73 pixels.
; PLAN: r0=154(x), r1=21(y), r2=36(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 21
LDI r2, 36
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
