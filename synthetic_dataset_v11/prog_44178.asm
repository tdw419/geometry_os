; DESCRIPTION: Creates a black rectangular region at (184, 8) spanning 50 by 35 pixels.
; PLAN: r0=184(x), r1=8(y), r2=50(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 8
LDI r2, 50
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
