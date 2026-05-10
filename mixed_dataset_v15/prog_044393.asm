; DESCRIPTION: Creates a black rectangular region at (153, 42) spanning 23 by 23 pixels.
; PLAN: r0=153(x), r1=42(y), r2=23(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 42
LDI r2, 23
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
