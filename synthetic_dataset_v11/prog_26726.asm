; DESCRIPTION: Creates a cyan rectangular region at (104, 22) spanning 40 by 105 pixels.
; PLAN: r0=104(x), r1=22(y), r2=40(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 22
LDI r2, 40
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
