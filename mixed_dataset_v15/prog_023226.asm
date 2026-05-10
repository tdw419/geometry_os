; DESCRIPTION: Creates a cyan rectangular region at (121, 67) spanning 104 by 112 pixels.
; PLAN: r0=121(x), r1=67(y), r2=104(width), r3=112(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 67
LDI r2, 104
LDI r3, 112
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
