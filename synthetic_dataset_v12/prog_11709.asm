; DESCRIPTION: Creates a yellow rectangular region at (229, 205) spanning 104 by 25 pixels.
; PLAN: r0=229(x), r1=205(y), r2=104(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 205
LDI r2, 104
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
