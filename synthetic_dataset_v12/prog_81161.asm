; DESCRIPTION: Creates a black rectangular region at (270, 37) spanning 42 by 68 pixels.
; PLAN: r0=270(x), r1=37(y), r2=42(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 37
LDI r2, 42
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
