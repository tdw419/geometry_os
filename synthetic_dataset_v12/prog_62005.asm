; DESCRIPTION: Creates a yellow rectangular region at (459, 45) spanning 45 by 66 pixels.
; PLAN: r0=459(x), r1=45(y), r2=45(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 45
LDI r2, 45
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
