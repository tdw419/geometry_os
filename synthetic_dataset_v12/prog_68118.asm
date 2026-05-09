; DESCRIPTION: Creates a white rectangular region at (42, 110) spanning 82 by 117 pixels.
; PLAN: r0=42(x), r1=110(y), r2=82(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 110
LDI r2, 82
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
