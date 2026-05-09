; DESCRIPTION: Creates a green rectangular region at (394, 11) spanning 104 by 68 pixels.
; PLAN: r0=394(x), r1=11(y), r2=104(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 11
LDI r2, 104
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
