; DESCRIPTION: Creates a yellow rectangular region at (68, 135) spanning 50 by 55 pixels.
; PLAN: r0=68(x), r1=135(y), r2=50(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 135
LDI r2, 50
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
