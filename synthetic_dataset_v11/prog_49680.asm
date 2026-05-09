; DESCRIPTION: Creates a cyan rectangular region at (7, 100) spanning 67 by 104 pixels.
; PLAN: r0=7(x), r1=100(y), r2=67(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 100
LDI r2, 67
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
