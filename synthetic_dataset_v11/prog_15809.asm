; DESCRIPTION: Creates a white rectangular region at (225, 82) spanning 28 by 50 pixels.
; PLAN: r0=225(x), r1=82(y), r2=28(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 82
LDI r2, 28
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
