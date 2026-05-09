; DESCRIPTION: Creates a yellow rectangular region at (294, 55) spanning 104 by 12 pixels.
; PLAN: r0=294(x), r1=55(y), r2=104(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 55
LDI r2, 104
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
