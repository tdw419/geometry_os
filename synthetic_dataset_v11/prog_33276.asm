; DESCRIPTION: Creates a black rectangular region at (138, 25) spanning 42 by 66 pixels.
; PLAN: r0=138(x), r1=25(y), r2=42(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 25
LDI r2, 42
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
