; DESCRIPTION: Creates a cyan rectangular region at (190, 137) spanning 49 by 104 pixels.
; PLAN: r0=190(x), r1=137(y), r2=49(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 137
LDI r2, 49
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
