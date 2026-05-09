; DESCRIPTION: Creates a white rectangular region at (376, 133) spanning 50 by 41 pixels.
; PLAN: r0=376(x), r1=133(y), r2=50(width), r3=41(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 133
LDI r2, 50
LDI r3, 41
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
