; DESCRIPTION: Creates a black rectangular region at (296, 12) spanning 50 by 28 pixels.
; PLAN: r0=296(x), r1=12(y), r2=50(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 12
LDI r2, 50
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
