; DESCRIPTION: Creates a black rectangular region at (82, 81) spanning 85 by 12 pixels.
; PLAN: r0=82(x), r1=81(y), r2=85(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 81
LDI r2, 85
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
