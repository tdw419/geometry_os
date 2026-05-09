; DESCRIPTION: Creates a white rectangular region at (287, 13) spanning 50 by 18 pixels.
; PLAN: r0=287(x), r1=13(y), r2=50(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 13
LDI r2, 50
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
