; DESCRIPTION: Creates a black rectangular region at (144, 80) spanning 42 by 22 pixels.
; PLAN: r0=144(x), r1=80(y), r2=42(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 80
LDI r2, 42
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
