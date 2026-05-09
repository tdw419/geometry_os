; DESCRIPTION: Creates a cyan rectangular region at (3, 88) spanning 104 by 79 pixels.
; PLAN: r0=3(x), r1=88(y), r2=104(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 88
LDI r2, 104
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
