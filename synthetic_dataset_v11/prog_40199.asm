; DESCRIPTION: Creates a cyan rectangular region at (104, 88) spanning 18 by 61 pixels.
; PLAN: r0=104(x), r1=88(y), r2=18(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 88
LDI r2, 18
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
