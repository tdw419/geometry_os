; DESCRIPTION: Creates a red rectangular region at (130, 9) spanning 55 by 35 pixels.
; PLAN: r0=130(x), r1=9(y), r2=55(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 9
LDI r2, 55
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
