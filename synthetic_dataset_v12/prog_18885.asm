; DESCRIPTION: Creates a yellow rectangular region at (305, 11) spanning 50 by 19 pixels.
; PLAN: r0=305(x), r1=11(y), r2=50(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 11
LDI r2, 50
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
