; DESCRIPTION: Creates a green rectangular region at (298, 55) spanning 104 by 37 pixels.
; PLAN: r0=298(x), r1=55(y), r2=104(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 55
LDI r2, 104
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
