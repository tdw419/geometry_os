; DESCRIPTION: Creates a black rectangular region at (21, 42) spanning 65 by 24 pixels.
; PLAN: r0=21(x), r1=42(y), r2=65(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 42
LDI r2, 65
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
