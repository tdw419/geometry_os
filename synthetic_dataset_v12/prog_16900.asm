; DESCRIPTION: Creates a black rectangular region at (273, 83) spanning 42 by 93 pixels.
; PLAN: r0=273(x), r1=83(y), r2=42(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 83
LDI r2, 42
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
