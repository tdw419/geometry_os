; DESCRIPTION: Creates a red rectangular region at (407, 25) spanning 55 by 48 pixels.
; PLAN: r0=407(x), r1=25(y), r2=55(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 25
LDI r2, 55
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
