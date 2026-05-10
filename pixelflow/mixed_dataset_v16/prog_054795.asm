; DESCRIPTION: Creates a yellow rectangular region at (214, 75) spanning 68 by 77 pixels.
; PLAN: r0=214(x), r1=75(y), r2=68(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 75
LDI r2, 68
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
