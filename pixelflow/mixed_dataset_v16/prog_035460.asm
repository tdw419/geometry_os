; DESCRIPTION: Creates a white rectangular region at (296, 50) spanning 68 by 61 pixels.
; PLAN: r0=296(x), r1=50(y), r2=68(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 50
LDI r2, 68
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
