; DESCRIPTION: Creates a green rectangular region at (246, 38) spanning 50 by 41 pixels.
; PLAN: r0=246(x), r1=38(y), r2=50(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 38
LDI r2, 50
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
